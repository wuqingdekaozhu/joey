from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from jose import jwt
from ..config import Config


oauth2_scheme = OAuth2PasswordBearer(tokenUrl='token')


def verify_token(token: str = Depends(oauth2_scheme)):
    try:
        payload = jwt.decode(token, Config.JWT_SECRET, algorithms=[Config.JWT_ALGORITHM])
        user_id = str(payload.get('id'))
        return user_id
    except Exception as e:
        print(e)
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e)
