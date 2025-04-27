from fastapi import APIRouter, Depends
from typing import Optional
from ..database import get_connection
from ..middlewares.bearer_token import verify_token


router = APIRouter(prefix='/search', tags=['Search'])


def read_search(search: str | None):
    query = ''
    if search != None:
        query = f'''
            SELECT * FROM get_registrable_courses
            WHERE subject_code LIKE '%{search}%'
            OR subject_name LIKE '%{search}%'
            OR `group` LIKE '%{search}%';
        '''
    else:
        query = f'''
            SELECT * FROM get_registrable_courses LIMIT 50
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


def search_class(user_id: str, id: int):
    query = f'''
        SELECT
            c.id AS class_id,
            c.subject_code AS subject_code,
            s.name AS subject_name,
            ti.name AS teacher,
            c.week AS week,
            c.location AS location,
            c.time AS time,
            b.grade AS grade
        FROM get_registrable_courses grc
        LEFT JOIN
            (SELECT
                r.grade,
                r.class_code
            FROM results r
            WHERE user_id = %s) AS b
            ON b.class_code = grc.class_id
        JOIN classes c ON grc.class_id = c.id
        JOIN teacher_information ti ON ti.id = c.teacher
        JOIN subjects s ON s.code = c.subject_code
        WHERE c.id = %s;
    '''
    print(query)

    try:
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute(query, [user_id, id])
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
async def get_search(user_id: str = Depends(verify_token), query: Optional[str] = None):
    results = read_search(query)
    if results == None:
        return []
    else:
        return results


@router.get('/class')
async def get_class(user_id: str = Depends(verify_token), id: Optional[str] = None):
    _class = search_class(user_id, int(id))
    if _class == None:
        return {'error': 'no registrable class with that id'}
    else:
        return _class