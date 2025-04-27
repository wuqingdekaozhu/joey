import React from 'react';

interface ISubject {
  class_id: string,
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
            </tr>)}
          </tbody>
        </table>
      </div>
    </div>
  </>;
};

export default Subjects;
