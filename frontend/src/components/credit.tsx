import React, { useState, useEffect } from 'react';
import { getUserCredit } from '@/hooks/user';

interface ICredit {
  current_gpa: number,
  acquired_credit: number,
  required_credit: number,
};

const Credit: React.FC = () => {
  const [credit, setCredit] = useState<ICredit | null>(null);

  useEffect(() => {
    (async () => {
      const data = await getUserCredit();
      setCredit(data ? data as ICredit : null)
    })();
  }, []);

  return <>
    <p className='text-[1.2rem] font-semibold m-[1rem]'>Credit Score</p>
    <div className='w-full flex mb-[2rem]'>
      <div className='w-[50%] bg-base-100 rounded-[0.5rem] shadow-lg p-[2rem] border-box flex'>
        <div className='w-[50%] flex flex-col'>
          <p className='font-semibold h-[2rem]'>Acquired Credit</p>
          <p className='font-semibold h-[2rem]'>Required Credit</p>
          <p className='font-semibold h-[2rem]'>Current GPA</p>
        </div>
        <div className='w-[50%] flex flex-col justify-center'>
          <p className='h-[2rem]'>{credit?.acquired_credit || 0}</p>
          <p className='h-[2rem]'>{credit?.required_credit}</p>
          <p className='h-[2rem]'>{Number(credit?.current_gpa || 0).toFixed(2)}</p>
        </div>
      </div>

      <div className='w-[50%] flex flex-col justify-evenly items-center p-[2rem] border-box flex'>
        <progress className='progress progress-success w-full h-[1rem]' value={Number((credit?.acquired_credit || 0) / (credit?.required_credit || 1) * 100).toFixed(0)} max='100'></progress>
        <p className='font-bold text-[1.5rem]'>Completion : {Number(((credit?.acquired_credit || 0) / (credit?.required_credit || 1) * 100).toFixed(2))}%</p>
      </div>
    </div>
  </>;
};

export default Credit;
