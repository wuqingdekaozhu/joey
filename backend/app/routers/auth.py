from fastapi import APIRouter
from pydantic import BaseModel
import datetime
from jose import jwt
from ..config import Config
from ..database import get_connection


router = APIRouter(prefix='/auth', tags=['Auth'])


class LoginDTO(BaseModel):
    id: str
    password: str


def verify_user(user_id: str, password: str):
    query = f'''
        SELECT * FROM user_auth WHERE id = %s AND password = %s;
    '''
    print(query)

    try:
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute(query, [user_id, password])
        result = cursor.fetchone()
        cursor.close()
        conn.close()

        return bool(result)
    except Exception as e:
        print(e)
        return False


def create_access_token(data: dict):
    to_encode = data.copy()
    expire = datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(days=Config.JWT_EXPIRE_DAYS)
    to_encode.update({'exp': expire})
    encoded_jwt = jwt.encode(to_encode, Config.JWT_SECRET, algorithm=Config.JWT_ALGORITHM)
    return encoded_jwt


@router.post('/login')
async def login(user: LoginDTO):
    if (verify_user(user.id, user.password)):
        return {'token': create_access_token({'id': user.id})}
    else:
        return {'error': 'id or password incorrect'}
