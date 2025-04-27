from fastapi import APIRouter, Depends
from pydantic import BaseModel
from ..database import get_connection
from ..middlewares.bearer_token import verify_token


router = APIRouter(prefix='/select', tags=['Select'])


class ClassSelectionDTO(BaseModel):
    class_id: int


def add_class(user_id: str, class_id: int):
    query = f'''
        INSERT INTO results (user_id, class_code, semester)
        SELECT id, %s, semester
        FROM user_information
        WHERE id = %s
        LIMIT 1;
    '''

    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute(query, [class_id, user_id])
        conn.commit()
        cursor.close()
        conn.close()
        return True
    except Exception as e:
        print(e)
        return False


def delete_class(user_id: str, class_id: int):
    query = f'''
        DELETE FROM results
        WHERE user_id = %s
        AND class_code = %s
    '''

    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute(query, [user_id, class_id])
        conn.commit()
        cursor.close()
        conn.close()
        return True
    except Exception as e:
        print(e)
        return False


@router.post('/select')
async def select_class(dto: ClassSelectionDTO, user_id: str = Depends(verify_token)):
    success = add_class(user_id, dto.class_id)
    return success


@router.post('/withdraw')
async def withdraw_class(dto: ClassSelectionDTO, user_id: str = Depends(verify_token)):
    success = delete_class(user_id, dto.class_id)
    return success
