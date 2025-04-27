import * as Cookies from './cookies';
import * as Config from '@/config';

export const login = async (id: string, password: string) => {
  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      id: id,
      password: password
    }),
  };

  try {
    const response = await fetch(`${Config.API_URL}/auth/login/`, options);
    const data = await response.json();

    if (data.error) {
      alert(data.error);
      return null;
    }

    const token = data.token;
    Cookies.setCookie('user', token);
    return token;
  } catch (err) {
    alert(`Unexpected error : ${err}`);
    return null;
  }
};

export const logout = () => {
  Cookies.removeCookie('user');
  location.href = '/';
};

export const getUser = () => {
  return Cookies.getCookie('user');
};

export const getUserProfile = async () => {
  const token = Cookies.getCookie('user');
  console.log('token', token);

  const options = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : '',
    },
  };

  try {
    const response = await fetch(`${Config.API_URL}/profile/get_profile/`, options);
    const data = await response.json();

    if (data.error) {
      alert(data.error);
      return null;
    }

    const profile = {
      id: data.id,
      name: data.name,
      college: data.college,
      major: data.major,
      year: data.year,
      nationality: data.nationality,
      contact: data.contact,
      picture: `${Config.MINIO_HOST}/${Config.MINIO_BUCKET}/${data.picture}`,
    };

    return profile;
  } catch (err) {
    alert(`Unexpected error : ${err}`);
    return null;
  }
};

export const getUserCredit = async () => {
  const token = Cookies.getCookie('user');
  console.log('token', token);

  const options = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : '',
    },
  };

  try {
    const response = await fetch(`${Config.API_URL}/credit/get_credit/`, options);
    const data = await response.json();

    if (data.error) {
      alert(data.error);
      return null;
    }

    return data;
  } catch (err) {
    alert(`Unexpected error : ${err}`);
    return null;
  }
};

export const getCreditBySubject = async () => {
  const token = Cookies.getCookie('user');
  console.log('token', token);

  const options = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : '',
    },
  };

  try {
    const response = await fetch(`${Config.API_URL}/credit/get_credit_by_subject/`, options);
    const data = await response.json();

    if (data.error) {
      alert(data.error);
      return [];
    }

    if (Array.isArray(data)) {
      return data;
    } else {
      return [];
    }
  } catch (err) {
    alert(`Unexpected error : ${err}`);
    return [];
  }
};

export const getCreditToBeEarned = async () => {
  const token = Cookies.getCookie('user');
  console.log('token', token);

  const options = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : '',
    },
  };

  try {
    const response = await fetch(`${Config.API_URL}/credit/get_credit_to_be_earned/`, options);
    const data = await response.json();

    if (data.error) {
      alert(data.error);
      return null;
    }

    console.log(data);

    if (data.fmepc !== undefined && data.subjects !== undefined) {
      return data;
    } else {
      return null;
    }
  } catch (err) {
    alert(`Unexpected error : ${err}`);
    return null;
  }
};

export const getResults = async () => {
  const token = Cookies.getCookie('user');
  console.log('token', token);

  const options = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : '',
    },
  };

  try {
    const response = await fetch(`${Config.API_URL}/result/`, options);
    const data = await response.json();

    if (data.error) {
      alert(data.error);
      return [];
    }

    if (Array.isArray(data)) {
      return data;
    } else {
      return [];
    }
  } catch (err) {
    alert(`Unexpected error : ${err}`);
    return [];
  }
};

export const getTimetable = async () => {
  const token = Cookies.getCookie('user');
  console.log('token', token);

  const options = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : '',
    },
  };

  try {
    const response = await fetch(`${Config.API_URL}/timetable/get_timetable/`, options);
    const data = await response.json();

    if (data.error) {
      alert(data.error);
      return [];
    }

    if (Array.isArray(data)) {
      return data;
    } else {
      return [];
    }
  } catch (err) {
    alert(`Unexpected error : ${err}`);
    return [];
  }
};

export const getExam = async () => {
  const token = Cookies.getCookie('user');
  console.log('token', token);

  const options = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : '',
    },
  };

  try {
    const response = await fetch(`${Config.API_URL}/timetable/get_exam/`, options);
    const data = await response.json();

    if (data.error) {
      alert(data.error);
      return [];
    }

    if (Array.isArray(data)) {
      return data;
    } else {
      return [];
    }
  } catch (err) {
    alert(`Unexpected error : ${err}`);
    return [];
  }
};

export const getSuggestedCourse = async () => {
  const token = Cookies.getCookie('user');
  console.log('token', token);

  const options = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : '',
    },
  };

  try {
    const response = await fetch(`${Config.API_URL}/credit/get_suggest_course/`, options);
    const data = await response.json();

    if (data.error) {
      alert(data.error);
      return [];
    }

    if (Array.isArray(data)) {
      return data;
    } else {
      return [];
    }
  } catch (err) {
    alert(`Unexpected error : ${err}`);
    return [];
  }
};

export const searchCourses = async (query: string) => {
  const token = Cookies.getCookie('user');
  console.log('token', token);

  const options = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : '',
    },
  };

  try {
    let qParam = '';
    if (query !== '') {
      qParam = `/?query=${encodeURIComponent(query)}`;
    }
    const response = await fetch(`${Config.API_URL}/search${qParam}`, options);
    const data = await response.json();

    if (data.error) {
      alert(data.error);
      return [];
    }

    if (Array.isArray(data)) {
      return data;
    } else {
      return [];
    }
  } catch (err) {
    alert(`Unexpected error : ${err}`);
    return [];
  }
};

export const searchClass = async (id: number) => {
  const token = Cookies.getCookie('user');
  console.log('token', token);

  const options = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : '',
    },
  };

  try {
    const response = await fetch(`${Config.API_URL}/search/class/?id=${encodeURIComponent(id)}`, options);
    const data = await response.json();

    if (data.error) {
      alert(data.error);
      return null;
    }

    return data;
  } catch (err) {
    alert(`Unexpected error : ${err}`);
    return null;
  }
};

export const selectClass = async (class_id: number) => {
  const token = Cookies.getCookie('user');
  console.log('token', token);

  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : '',
    },
    body: JSON.stringify({
      class_id: class_id
    }),
  };

  try {
    const response = await fetch(`${Config.API_URL}/select/select/`, options);
    const data = await response.json();

    if (data === true) {
      alert('Class added successfully');
    } else {
      alert('Class selection failed')
    }
  } catch (err) {
    alert(`Unexpected error : ${err}`);
  }
};

export const withdrawClass = async (class_id: number) => {
  const token = Cookies.getCookie('user');
  console.log('token', token);

  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : '',
    },
    body: JSON.stringify({
      class_id: class_id
    }),
  };

  try {
    const response = await fetch(`${Config.API_URL}/select/withdraw/`, options);
    const data = await response.json();

    if (data === true) {
      alert('Class withdrawn successfully');
    } else {
      alert('Class withdrawal failed');
    }
  } catch (err) {
    alert(`Unexpected error : ${err}`);
  }
};
