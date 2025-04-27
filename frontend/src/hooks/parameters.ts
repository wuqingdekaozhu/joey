import * as Cookies from './cookies';
import * as Config from '@/config';

export const getParameter = async (key: string) => {
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
    const response = await fetch(`${Config.API_URL}/parameter/?key=${encodeURIComponent(key)}`, options);
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

export const getNotifications = async () => {
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
    const response = await fetch(`${Config.API_URL}/notification`, options);
    const data = await response.json();

    if (data.error) {
      alert(data.error);
      return [];
    }

    console.log(data);

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
  