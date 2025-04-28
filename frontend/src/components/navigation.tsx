import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { logout } from '@/hooks/user';

const Navigation: React.FC = () => {
  const [menu1, setMenu1] = useState<boolean>(false);
  const [menu2, setMenu2] = useState<boolean>(false);
  const [menu3, setMenu3] = useState<boolean>(false);

  const handleLogout = () => {
    logout();
  };

  return <>
    <div>
      <Link to='/'>
        <button className='btn w-full mb-[1rem] h-[3rem] justify-start'>
          <p className='font-black'>Home</p>
        </button>
      </Link>

      <button className='btn btn-outline w-full h-[3rem] justify-between' onClick={() => setMenu1((prev) => !prev)}>
        <p className='font-black'>Credit Check</p>
        <img src='/chev.svg' className={`transform ${menu1 ? '' : 'rotate-180'} transition-all duration-300 ease-in-out`}/>
      </button>

      <div className={`${menu1 ? 'h-[8rem]' : 'h-0'} overflow-hidden transition-all duration-300 ease-in-out`} >
        <Link to='/creditEarned'>
          <button className='btn w-full mt-[0.5rem] h-[2rem] justify-start'>
            <p className='ml-[2rem]'>Credit Earned</p>
          </button>
        </Link>
        <Link to='/creditToBeEarned'>
          <button className='btn w-full mt-[0.5rem] h-[2rem] justify-start'>
            <p className='ml-[2rem]'>Credit to be Earned</p>
          </button>
        </Link>
        <Link to='/suggestCourses'>
          <button className='btn w-full mt-[0.5rem] h-[2rem] justify-start'>
            <p className='ml-[2rem]'>Suggest Courses</p>
          </button>
        </Link>
      </div>

      <button className='btn btn-outline w-full h-[3rem] mt-[1rem] justify-between' onClick={() => setMenu2((prev) => !prev)}>
        <p className='font-black'>Course Selection</p>
        <img src='/chev.svg' className={`transform ${menu2 ? '' : 'rotate-180'} transition-all duration-300 ease-in-out`}/>
      </button>

      <div className={`${menu2 ? 'h-[5.5rem]' : 'h-0'} overflow-hidden transition-all duration-300 ease-in-out`} >
        <Link to='/selecting'>
          <button className='btn w-full mt-[0.5rem] h-[2rem] justify-start'>
            <p className='ml-[2rem]'>Selecting</p>
          </button>
        </Link>
        <Link to='/withdrawal'>
          <button className='btn w-full mt-[0.5rem] h-[2rem] justify-start'>
            <p className='ml-[2rem]'>Withdrawal</p>
          </button>
        </Link>
      </div>

      <button className='btn btn-outline w-full h-[3rem] mt-[1rem] justify-between' onClick={() => setMenu3((prev) => !prev)}>
        <p className='font-black'>Result</p>
        <img src='/chev.svg' className={`transform ${menu3 ? '' : 'rotate-180'} transition-all duration-300 ease-in-out`}/>
      </button>

      <div className={`${menu3 ? 'h-[5.5rem]' : 'h-0'} overflow-hidden transition-all duration-300 ease-in-out`} >
        <Link to='/results'>
          <button className='btn w-full mt-[0.5rem] h-[2rem] justify-start'>
            <p className='ml-[2rem]'>Result Check</p>
          </button>
        </Link>
        <Link to='/examSchedule'>
          <button className='btn w-full mt-[0.5rem] h-[2rem] justify-start'>
            <p className='ml-[2rem]'>Exam Schedule</p>
          </button>
        </Link>
      </div>

      <hr />

      <button className='btn btn-error w-full' onClick={handleLogout}>Logout</button>
    </div>
  </>;
};

export default Navigation;
