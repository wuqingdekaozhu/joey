from fastapi import APIRouter, Depends, Query
from ..database import get_connection
from ..middlewares.bearer_token import verify_token


router = APIRouter(prefix='/parameter', tags=['Parameter'])


def read_parameter(key: str):
    query = f'''
        SELECT value FROM parameters WHERE `key` = %s;
    '''
    print(query)

    try:
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute(query, [key])
        result = cursor.fetchone()
        cursor.close()
        conn.close()

        if result:
            return result
        else:
            return None
    except Exception as e:
        print(e)
        return None


@router.get('')
async def get_parameter(user_id: str = Depends(verify_token), key: str = Query(..., min_length=1)):
    value = read_parameter(key)
    return value
