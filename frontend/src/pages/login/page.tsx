import React from 'react';
import { useNavigate } from 'react-router-dom';
import { useForm } from 'react-hook-form';
import { login } from '@/hooks/user';

interface ILoginData {
  id: string,
  password: string,
};

const LoginPage: React.FC = () => {
  const navigate = useNavigate();

  const { register, handleSubmit, setValue } = useForm<ILoginData>();

  const onSubmit = async (data: ILoginData) => {
    if (!(await login(data.id, data.password))) {
      setValue('password', '');
    } else {
      navigate('/');
    }
  };

  return <>
    <form className='w-screen h-screen justify-center items-center flex z-0' onSubmit={handleSubmit(onSubmit)}>
      <div className='bg-base-100 w-[30%] shadow-lg rounded-[0.5rem] justify-center items-center flex flex-col p-[2rem] border-box'>
        <label className='input w-full mb-[1rem]'>
          <img src='/id.svg' />
          <input
            type='text'
            className='grow'
            placeholder='Student ID'
            {...register('id', { required: 'ID is required' })} />
        </label>
        <label className='input w-full mb-[1rem]'>
          <img src='/password.svg' />
          <input
            type='password'
            className='grow'
            placeholder='Password'
            {...register('password', { required: 'Password is required' })} />
        </label>
        <button className='btn btn-outline w-full' type='submit'>Login</button>
      </div>
    </form>
  </>;
};

export default LoginPage;
