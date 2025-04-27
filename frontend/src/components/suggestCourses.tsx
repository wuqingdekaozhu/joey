import React, { useState, useEffect } from 'react';
import { getSuggestedCourse } from '@/hooks/user';

interface ISubject {
  subject_code: string,
  subject_name: string,
  group: string,
  credit: number,
};

const SuggestCourses: React.FC = () => {
  const [subjects, setSubjects] = useState<ISubject[]>([]);

  useEffect(() => {
    (async () => {
      const data = await getSuggestedCourse();
      setSubjects(data as ISubject[]);
    })();
  }, []);

  return <>
    <p className='text-[1.2rem] font-semibold m-[1rem]'>Courses Suggested for Current Semester</p>
    
    <div className='w-full bg-base-100 flex p-[1rem] mb-[2rem] border-box rounded-[0.5rem] shadow-lg'>
      <div className='w-full flex flex-col justify-center items-center overflow-x-auto'>
        <table className='table table-zebra'>
          <thead>
            <tr>
              <th>Subject Code</th>
              <th>Subject Name</th>
              <th>Group</th>
              <th>Credit</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            {subjects.map((item) => <tr>
              <th>{item.subject_code}</th>
              <td>{item.subject_name}</td>
              <td>{item.group}</td>
              <td>{Number(item.credit).toFixed(1)}</td>
              <td>
                <a
                  className='btn btn-sm btn-success'
                  href={`/selecting/?query=${encodeURIComponent(item.subject_code)}`}
                  target='_blank'
                >
                  Search
                </a>
              </td>
            </tr>)}
          </tbody>
        </table>
      </div>
    </div>
  </>;
};

export default SuggestCourses;
