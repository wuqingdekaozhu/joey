import React, { useEffect } from 'react';
import { Routes, Route } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import { getUser } from '@/hooks/user';
import CreditEarnedPage from '@/pages/home/creditEarned/page';
import CreditToBeEarnedPage from '@/pages/home/creditToBeEarned/page';
import SuggestCoursesPage from '@/pages/home/suggestCourses/page';
import ResultsPage from '@/pages/home/results/page';
import ExamSchedulePage from '@/pages/home/examSchedule/page';
import SelectingPage from '@/pages/home/selecting/page';
import ClassPage from '@/pages/home/class/page';
import WithdrawalPage from '@/pages/home/withdrawal/page';
import Navigation from '@/components/navigation';
import Profile from '@/components/profile';
import Title from '@/components/title';
import Credit from '@/components/credit';
import Sidebar from '@/components/sidebar';
import Timetable from '@/components/timetable';

const DashboardPage: React.FC = () => {
  return <>
    <Profile />
    <Credit />
    <Timetable />
  </>;
};

const HomePage: React.FC = () => {
  const navigate = useNavigate();

  useEffect(()=> {
    if (!getUser()) {
      navigate('/login');
    }
  }, []);

  return <>
    <div className='w-[20%] h-screen p-[1rem] border-box fixed'>
      <div className='w-full h-full bg-base-100 rounded-[0.5rem] p-[1rem] border-box overflow-y-scroll'>
        <Navigation />
      </div>
    </div>
    <div className='w-[60%] ml-[20%] h-screen p-[1rem] border-box'>
      <div className='w-full h-full p-[1rem] border-box flex flex-col'>
        <Title />
        <Routes>
          <Route path='' element={<DashboardPage />} />
          <Route path='creditEarned' element={<CreditEarnedPage />} />
          <Route path='creditToBeEarned' element={<CreditToBeEarnedPage />} />
          <Route path='suggestCourses' element={<SuggestCoursesPage />} />
          <Route path='results' element={<ResultsPage />} />
          <Route path='examSchedule' element={<ExamSchedulePage />} />
          <Route path='selecting' element={<SelectingPage />} />
          <Route path='class' element={<ClassPage />} />
          <Route path='withdrawal' element={<WithdrawalPage />} />
        </Routes>
        <div className='divider'></div>
      </div>
    </div>
    <div className='w-[20%] h-screen p-[1rem] border-box'>
      <div className='w-full h-full p-[1rem] border-box'>
        <Sidebar />
      </div>
    </div>
  </>;
};

export default HomePage;
