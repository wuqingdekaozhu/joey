from fastapi import APIRouter, Depends
from ..database import get_connection
from ..middlewares.bearer_token import verify_token


router = APIRouter(prefix='/timetable', tags=['Timetable'])


def read_timetable(user_id: str):
    query = f'''
        SELECT * FROM get_timetable WHERE id = %s;
    '''
    print(query)

    try:
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute(query, [user_id])
        result = cursor.fetchall()
        cursor.close()
        conn.close()

        if result:
            return result
        else:
            return None
    except Exception as e:
        print(e)
        return None


def read_exam(user_id: str):
    query = f'''
        SELECT * FROM get_exam WHERE id = %s;
    '''
    print(query)

    try:
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute(query, [user_id])
        result = cursor.fetchall()
        cursor.close()
        conn.close()

        if result:
            return result
        else:
            return None
    except Exception as e:
        print(e)
        return None


@router.get('/get_timetable')
async def get_timetable(user_id: str = Depends(verify_token)):
    timetable = read_timetable(user_id)
    if timetable == None:
        return []
    else:
        return timetable


@router.get('/get_exam')
async def get_exam(user_id: str = Depends(verify_token)):
    exam = read_exam(user_id)
    if exam == None:
        return []
    else:
        return exam
