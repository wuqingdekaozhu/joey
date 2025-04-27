import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import LoginPage from '@/pages/login/page';
import HomePage from '@/pages/home/page';
import ProgressBar from '@/components/progressBar';

const App: React.FC = () => {
  return <>
    <div className='w-screen h-full overflow-y-scroll bg-blue-200 flex'>
      <Router>
        <ProgressBar />
        <Routes>
          <Route path='/login' element={<LoginPage />} />
          <Route path='/*' element={<HomePage />} />
        </Routes>
      </Router>
    </div>
  </>;
};

export default App;
