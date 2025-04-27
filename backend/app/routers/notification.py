from fastapi import APIRouter, Depends
from ..database import get_connection
from ..middlewares.bearer_token import verify_token


router = APIRouter(prefix='/notification', tags=['Notification'])


def read_notifications(user_id: str):
    query = f'''
        SELECT * FROM notifications;
    '''
    print(query)

    try:
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute(query)
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
async def get_notifications(user_id: str = Depends(verify_token)):
    notifications = read_notifications(user_id)
    if notifications == None:
        return []
    else:
        return notifications
