import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useForm } from 'react-hook-form';
import { searchCourses } from '@/hooks/user';

interface ISearch {
  query: string,
};

interface IResult {
  class_id: string,
  subject_code: string,
  subject_name: string,
  group: string,
};

interface SearchProps {
  query: string,
};

const Search: React.FC<SearchProps> = ({ query: query }) => {
  const navigate = useNavigate();

  const [results, setResults] = useState<IResult[]>([]);

  const search = async (query: string) => {
    const data = await searchCourses(query);
    setResults(data as IResult[]);
  };

  useEffect(() => {
    search(query);
  }, [query]);

  const { register, handleSubmit } = useForm<ISearch>({defaultValues: {query: query}});

  const onSubmit = async (data: ISearch) => {
    navigate(`/selecting/?query=${encodeURIComponent(data.query)}`);
  };
  
  return <>
    <form onSubmit={handleSubmit(onSubmit)}>
      <label className='input input-lg w-full bg-base-100 flex my-[2rem] rounded-[0.5rem] shadow-lg'>
        <img src='/search.svg' />
        <input
          type='search'
          className='grow'
          placeholder='Search by Subject Code or Subject Name'
          {...register('query')} />
      </label>
    </form>

    <p className='text-[1.2rem] font-semibold m-[1rem]'>Available Courses</p>

    <div className='p-[1rem] w-full bg-base-100 flex mb-[2rem] border-box rounded-[0.5rem] shadow-lg' >
      <div className='w-full flex flex-col justify-center items-center overflow-x-auto'>
        <table className='table table-zebra'>
          <thead>
            <tr>
              <th>Class ID</th>
              <th>Subject Code</th>
              <th>Subject Name</th>
              <th>Group</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            {results.map((item, index) => (<tr key={index}>
              <th>{item.class_id}</th>
              <td>{item.subject_code}</td>
              <td>{item.subject_name}</td>
              <td>{item.group}</td>
              <td><a className='btn btn-sm btn-success' href={`/class/?id=${item.class_id}`} target='_blank'>View</a></td>
            </tr>))}
          </tbody>
        </table>
      </div>
    </div>
  </>;
};

export default Search;
