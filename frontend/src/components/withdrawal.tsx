import React, { useEffect, useState } from 'react';
import { getTimetable, withdrawClass } from '@/hooks/user';
import Schedule from '@/components/schedule';

interface ITimetable {
  class_id: number,
  subject_code: string,
  subject_name: string,
  teacher_name: string,
  credit: number,
  time: string,
  location: string,
  week: string,
};

interface ISubject {
  class_id: number,
  subject_code: string,
  subject_name: string,
  teacher_name: string,
  credit: number,
  week: string,
};

interface SubjectsProps {
  subjects: any[],
};

const Subjects: React.FC<SubjectsProps> = ({ subjects: subjectsT }) => {
  const subjects = subjectsT as ISubject[];

  const handleClick = (id: number, name: string) => {
    const result = confirm(`Confirm to withdraw Class ID ${id} (${name})`);
    if (result) {
      withdrawClass(id).then(() => window.location.reload());
    }
  };

  return <>
    <p className='text-[1.2rem] font-semibold m-[1rem]'>Subjects</p>

    <div className='w-full bg-base-100 flex p-[1rem] mb-[2rem] border-box rounded-[0.5rem] shadow-lg'>
      <div className='w-full flex flex-col justify-center items-center overflow-x-auto'>
        <table className='table table-zebra'>
          <thead>
            <tr>
              <th>Class ID</th>
              <th>Subject Code</th>
              <th>Subject Name</th>
              <th>Teacher</th>
              <th>Credit Score</th>
              <th>Week</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            {subjects.map((item, index) => <tr key={index}>
              <th>{item.class_id}</th>
              <td>{item.subject_code}</td>
              <td>{item.subject_name}</td>
              <td>{item.teacher_name}</td>
              <td>{Number(item.credit).toFixed(1)}</td>
              <td>{item.week.split(',').join(' - ')}</td>
              <td>
                <button
                  className='btn btn-error btn-sm'
                  onClick={() => handleClick(item.class_id, item.subject_name)}
                >
                  Withdraw
                </button>
              </td>
            </tr>)}
          </tbody>
        </table>
      </div>
    </div>
  </>;
};

const Withdrawal: React.FC = () => {
  const [timetable, setTimetable] = useState<ITimetable[]>([]);

  useEffect(() => {
    (async () => {
      const data = await getTimetable();
      setTimetable(data as ITimetable[]);
    })();
  }, []);
  
  return <>
    <Schedule slots={timetable} />
    <Subjects subjects={timetable} />
  </>;
};

export default Withdrawal;
