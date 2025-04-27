export const setCookie = (name: string, value: string, days = 1) => {
  const expires = new Date(Date.now() + days * 864e5).toUTCString();
  document.cookie = `${name}=${encodeURIComponent(value)}; expires=${expires}; path=/`;
};

export const getCookie = (name: string) => {
  const cookies = document.cookie.split('; ');

  for (let cookie of cookies) {
    const [key, val] = cookie.split('=');
    if (key === name) {
      return decodeURIComponent(val);
    }
  }

  return null;
};

export const removeCookie = (name: string) => {
  document.cookie = `${name}=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/`;
};
