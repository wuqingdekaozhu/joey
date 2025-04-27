import React, { useEffect, useState } from 'react';
import { getTimetable } from '@/hooks/user';
import Schedule from '@/components/schedule';
import Subjects from '@/components/subjects';

interface ITimetable {
  class_id: string,
  subject_code: string,
  subject_name: string,
  teacher_name: string,
  credit: number,
  time: string,
  location: string,
  week: string,
};

const Timetable: React.FC = () => {
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

export default Timetable;
