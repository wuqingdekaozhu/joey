import React, { useEffect, useState } from 'react';
import { getTimetable, searchClass, selectClass } from '@/hooks/user';
import Schedule from '@/components/schedule';

interface IClass {
  class_id: number,
  subject_code: string,
  subject_name: string,
  teacher: string,
  week: string,
  location: string,
  time: string,
  grade: number,
};

interface ISlot {
  subject_code: string,
  location: string,
  time: string,
};

interface ClassProps {
  id: number,
};

const Class: React.FC<ClassProps> = ({ id: id }) => {
  const [course, setCourse] = useState<IClass | null>(null);
  const [slots, setSlots] = useState<ISlot[]>([]);

  useEffect(() => {
    (async () => {
      const data = await searchClass(id);
      setCourse(data as IClass | null);
      if (data) {
        const data_1 = await getTimetable();
        setSlots([...data_1 as ISlot[], data as ISlot]);
      }
    })();
  }, []);

  const handleClick = () => {
    if (course) {
      selectClass(course.class_id).then(() => window.location.href = '/');
    }
  };
  
  return <>
    <p className='text-[1.2rem] font-semibold m-[1rem]'>Class Details</p>
    <div className='w-full bg-base-100 px-[2rem] py-[1rem] mb-[1rem] border-box rounded-[0.5rem] shadow-lg'>
      <p className='my-[0.5rem]'>Class ID : {course?.class_id}</p>
      <p className='mb-[0.5rem]'>Subject Code : {course?.subject_code}</p>
      <p className='mb-[0.5rem]'>Subject Name : {course?.subject_name}</p>
      <p className='mb-[0.5rem]'>Teacher : {course?.teacher}</p>
      <p className='mb-[0.5rem]'>Week : {course?.week.split(',').join(' - ')}</p>
    </div>
    
    <button
      className='btn btn-neutral rounded-[0.5rem] shadow-lg mb-[2rem]'
      disabled={course?.grade === 0}
      onClick={handleClick}
    >
      ADD CLASS
    </button>

    <Schedule slots={slots}/>
  </>;
};

export default Class;
