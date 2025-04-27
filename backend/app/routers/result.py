from fastapi import APIRouter, Depends
from ..database import get_connection
from ..middlewares.bearer_token import verify_token


router = APIRouter(prefix='/result', tags=['Result'])


def read_results(user_id: str):
    query = f'''
        SELECT * FROM get_results WHERE id = %s;
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


@router.get('')
async def get_results(user_id: str = Depends(verify_token)):
    results = read_results(user_id)
    if results == None:
        return []
    else:
        return results
