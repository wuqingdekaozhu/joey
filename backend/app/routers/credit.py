from fastapi import APIRouter, Depends
from ..database import get_connection
from ..middlewares.bearer_token import verify_token


router = APIRouter(prefix='/credit', tags=['Credit'])


def read_credit(user_id: str):
    query = f'''
        SELECT * FROM get_credit_profile WHERE id = %s;
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


def read_credit_by_subject(user_id: str):
    query = f'''
        SELECT * FROM get_credit_by_subject WHERE id = %s;
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


def read_credit_to_be_earned(user_id: str):
    query = f'''
        SELECT * FROM get_credit_to_be_earned WHERE id = %s;
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


def read_credit_distribution(user_id: str):
    query = f'''
        SELECT * FROM get_credit_distribution WHERE id = %s;
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


def parse_dist(dist):
    result = {
        'acquired': [0, 0, 0, 0, 0],
        'required': [0, 0, 0, 0, 0]
    }
    result['required'] = str(dist[0]['distribution_FMEPC']).split(',')
    result['required'] = [int(x) for x in result['required']]
    for i in dist:
        if i['group'] == 'Foundation' and i['credit'] != None:
            result['acquired'][0] = i['credit']
        elif i['group'] == 'Major' and i['credit'] != None:
            result['acquired'][1] = i['credit']
        elif i['group'] == 'Elective' and i['credit'] != None:
            result['acquired'][2] = i['credit']
        elif i['group'] == 'Practical' and i['credit'] != None:
            result['acquired'][3] = i['credit']
        elif i['group'] == 'Coacademic' and i['credit'] != None:
            result['acquired'][4] = i['credit']
    return result


def read_suggest_course(user_id: str):
    query = f'''
        SELECT * FROM get_suggest_course WHERE id = %s;
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


@router.get('/get_credit')
async def get_credit(user_id: str = Depends(verify_token)):
    credit = read_credit(user_id)
    if credit == None:
        return {'error': 'no data found'}
    else:
        return credit


@router.get('/get_credit_by_subject')
async def get_credit_by_subject(user_id: str = Depends(verify_token)):
    credit = read_credit_by_subject(user_id)
    if credit == None:
        return []
    else:
        return credit


@router.get('/get_credit_to_be_earned')
async def get_credit_to_be_earned(user_id: str = Depends(verify_token)):
    dist = read_credit_distribution(user_id)
    fmepc = None
    if dist:
        fmepc = parse_dist(dist)
    print(fmepc)
    credit = read_credit_to_be_earned(user_id)
    if credit == None:
        return {'error': 'no data found'}
    else:
        return {'fmepc': fmepc, 'subjects': credit}


@router.get('/get_suggest_course')
async def get_suggest_course(user_id: str = Depends(verify_token)):
    subjects = read_suggest_course(user_id)
    if subjects == None:
        return []
    else:
        return subjects
