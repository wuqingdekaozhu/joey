import React, { useState, useEffect } from 'react';
import { getCreditBySubject } from '@/hooks/user';

interface ISubject {
  code: string,
  name: string,
  semester: string,
  credit: number,
};

const CreditBySubjects: React.FC = () => {
  const [subjects, setSubjects] = useState<ISubject[]>([]);

  useEffect(() => {
    (async () => {
      const data = await getCreditBySubject();
      setSubjects(data as ISubject[]);
    })();
  }, []);

  return <>
    <p className='text-[1.2rem] font-semibold m-[1rem]'>Credit By Subjects</p>
    <div className='w-full bg-base-100 flex p-[1rem] mb-[2rem] border-box rounded-[0.5rem] shadow-lg'>
      <div className='w-full flex flex-col justify-center items-center overflow-x-auto'>
        <table className='table table-zebra'>
          <thead>
            <tr>
              <th>Subject Code</th>
              <th>Subject Name</th>
              <th>Semester</th>
              <th>Credit Score</th>
            </tr>
          </thead>
          <tbody>
            {subjects.map((item) => <tr>
              <th>{item.code}</th>
              <td>{item.name}</td>
              <td>{item.semester}</td>
              <td>{Number(item.credit).toFixed(1)}</td>
            </tr>)}
          </tbody>
        </table>
      </div>
    </div>
  </>;
};

export default CreditBySubjects;
