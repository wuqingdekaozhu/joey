from fastapi import APIRouter, Depends
from ..database import get_connection
from ..middlewares.bearer_token import verify_token


router = APIRouter(prefix='/profile', tags=['Profile'])


def read_profile(user_id: str):
    query = f'''
        SELECT * FROM get_user_profile WHERE id = %s;
    '''
    print(query)

    try:
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute(query, [user_id])
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


@router.get('/get_profile')
async def get_profile(user_id: str = Depends(verify_token)):
    profile = read_profile(user_id)
    if profile == None:
        return {'error': 'no data found'}
    else:
        return profile
