import React, { useEffect, useState } from 'react';
import { getResults } from '@/hooks/user';

interface IResult {
  code: string,
  name: string,
  score: string,
  semester: number,
  grade: number,
};

const Results: React.FC = () => {
  const [results, setResults] = useState<IResult[]>([]);

  useEffect(() => {
    (async () => {
      const data = await getResults();
      setResults(data as IResult[]);
    })();
  }, []);
  
  return <>
    <p className='text-[1.2rem] font-semibold m-[1rem]'>Results</p>

    <div className='p-[1rem] w-full bg-base-100 flex mb-[2rem] border-box rounded-[0.5rem] shadow-lg' >
      <div className='w-full flex flex-col justify-center items-center overflow-x-auto'>
        <table className='table table-zebra'>
          <thead>
            <tr>
              <th>Subject Code</th>
              <th>Subject Name</th>
              <th>Semester</th>
              <th>Score</th>
              <th>Grade</th>
            </tr>
          </thead>
          <tbody>
            {results.map((item, index) => (<tr key={index}>
              <th>{item.code}</th>
              <td>{item.name}</td>
              <td>{item.semester}</td>
              <td>{item.score}</td>
              <td>{Number(item.grade).toFixed(1)}</td>
            </tr>))}
          </tbody>
        </table>
      </div>
    </div>
  </>;
};

export default Results;
