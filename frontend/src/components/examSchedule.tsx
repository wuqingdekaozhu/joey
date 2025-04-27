import React, { useState, useEffect } from 'react';
import { getExam } from '@/hooks/user';

interface IExam {
  class_id: string,
  subject_code: string,
  subject_name: string,
  exam: string,
};

const ExamSchedule: React.FC = () => {
  const [exams, setExams] = useState<IExam[]>([]);

  useEffect(() => {
    (async () => {
      const data = await getExam();
      setExams(data as IExam[]);
    })();
  }, []);

  return <>
    <p className='text-[1.2rem] font-semibold m-[1rem]'>Exam Schedule</p>
    <div className='w-full bg-base-100 flex p-[1rem] mb-[2rem] border-box rounded-[0.5rem] shadow-lg'>
      <div className='w-full flex flex-col justify-center items-center overflow-x-auto'>
        <table className='table table-zebra'>
          <thead>
            <tr>
              <th>Class ID</th>
              <th>Subject Code</th>
              <th>Subject Name</th>
              <th>Date</th>
              <th>Time</th>
              <th>Venue</th>
            </tr>
          </thead>
          <tbody>
            {exams.map((item, index) => <tr key={index}>
              <th>{item.class_id}</th>
              <td>{item.subject_code}</td>
              <td>{item.subject_name}</td>
              <td>{item.exam.split('|')[0]}</td>
              <td>{item.exam.split('|')[1]}</td>
              <td>{item.exam.split('|')[2]}</td>
            </tr>)}
          </tbody>
        </table>
      </div>
    </div>
  </>;
};

export default ExamSchedule;
