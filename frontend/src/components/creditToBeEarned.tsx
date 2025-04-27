import React, { useEffect, useState } from 'react';
import { getCreditToBeEarned } from '@/hooks/user';

interface ISubject {
  code: string,
  name: string,
  credit: number,
  group: string,
  grade: string,
};

const CreditToBeEarned: React.FC = () => {
  const [acquired, setAcquired] = useState<number[]>([0, 0, 0, 0, 0]);
  const [required, setRequired] = useState<number[]>([0, 0, 0, 0, 0]);
  const [subjects, setSubjects] = useState<ISubject[]>([]);

  useEffect(() => {
    (async () => {
      const data = await getCreditToBeEarned();
      setSubjects(data.subjects as ISubject[]);
      setAcquired(data.fmepc.acquired as number[]);
      setRequired(data.fmepc.required as number[]);
    })();
  }, []);
  
  return <>
    <p className='text-[1.2rem] font-semibold m-[1rem]'>Foundation Courses ({acquired[0]}/{required[0]})</p>

    <div className='p-[1rem] w-full bg-base-100 flex mb-[2rem] border-box rounded-[0.5rem] shadow-lg' >
      <div className='w-full flex flex-col justify-center items-center overflow-x-auto'>
        <table className='table table-zebra'>
          <thead>
            <tr>
              <th>Subject Code</th>
              <th>Subject Name</th>
              <th>Credit Score</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            {subjects.map((item, index) => (item.group === 'Foundation' && <tr key={index}>
              <th>{item.code}</th>
              <td>{item.name}</td>
              <td>{Number(item.credit).toFixed(1)}</td>
              <td>{item.grade === null || item.grade == '0' ? 'pending' : 'done'}</td>
            </tr>))}
          </tbody>
        </table>
      </div>
    </div>

    <p className='text-[1.2rem] font-semibold m-[1rem]'>Major Courses ({acquired[1]}/{required[1]})</p>

    <div className='p-[1rem] w-full bg-base-100 flex mb-[2rem] border-box rounded-[0.5rem] shadow-lg' >
      <div className='w-full flex flex-col justify-center items-center overflow-x-auto'>
        <table className='table table-zebra'>
          <thead>
            <tr>
              <th>Subject Code</th>
              <th>Subject Name</th>
              <th>Credit Score</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            {subjects.map((item, index) => (item.group === 'Major' && <tr key={index}>
              <th>{item.code}</th>
              <td>{item.name}</td>
              <td>{Number(item.credit).toFixed(1)}</td>
              <td>{item.grade === null || item.grade == '0' ? 'pending' : 'done'}</td>
            </tr>))}
          </tbody>
        </table>
      </div>
    </div>

    <p className='text-[1.2rem] font-semibold m-[1rem]'>Elective Courses ({acquired[2]}/{required[2]})</p>

    <div className='p-[1rem] w-full bg-base-100 flex mb-[2rem] border-box rounded-[0.5rem] shadow-lg' >
      <div className='w-full flex flex-col justify-center items-center overflow-x-auto'>
        <table className='table table-zebra'>
          <thead>
            <tr>
              <th>Subject Code</th>
              <th>Subject Name</th>
              <th>Credit Score</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            {subjects.map((item, index) => (item.group === 'Elective' && <tr key={index}>
              <th>{item.code}</th>
              <td>{item.name}</td>
              <td>{Number(item.credit).toFixed(1)}</td>
              <td>{item.grade === null || item.grade == '0' ? 'pending' : 'done'}</td>
            </tr>))}
          </tbody>
        </table>
      </div>
    </div>

    <p className='text-[1.2rem] font-semibold m-[1rem]'>Practical Courses ({acquired[3]}/{required[3]})</p>

    <div className='p-[1rem] w-full bg-base-100 flex mb-[2rem] border-box rounded-[0.5rem] shadow-lg' >
      <div className='w-full flex flex-col justify-center items-center overflow-x-auto'>
        <table className='table table-zebra'>
          <thead>
            <tr>
              <th>Subject Code</th>
              <th>Subject Name</th>
              <th>Credit Score</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            {subjects.map((item, index) => (item.group === 'Practical' && <tr key={index}>
              <th>{item.code}</th>
              <td>{item.name}</td>
              <td>{Number(item.credit).toFixed(1)}</td>
              <td>{item.grade === null || item.grade == '0' ? 'pending' : 'done'}</td>
            </tr>))}
          </tbody>
        </table>
      </div>
    </div>

    <p className='text-[1.2rem] font-semibold m-[1rem]'>Coacademic Courses ({acquired[4]}/{required[4]})</p>

    <div className='p-[1rem] w-full bg-base-100 flex mb-[2rem] border-box rounded-[0.5rem] shadow-lg' >
      <div className='w-full flex flex-col justify-center items-center overflow-x-auto'>
        <table className='table table-zebra'>
          <thead>
            <tr>
              <th>Subject Code</th>
              <th>Subject Name</th>
              <th>Credit Score</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            {subjects.map((item, index) => (item.group === 'Coacademic' && <tr key={index}>
              <th>{item.code}</th>
              <td>{item.name}</td>
              <td>{Number(item.credit).toFixed(1)}</td>
              <td>{item.grade === null || item.grade == '0' ? 'pending' : 'done'}</td>
            </tr>))}
          </tbody>
        </table>
      </div>
    </div>
  </>;
};

export default CreditToBeEarned;
