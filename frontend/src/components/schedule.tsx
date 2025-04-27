import React, { useState, useEffect } from 'react';

const colors = ['green', 'red', 'purple', 'amber', 'cyan', 'orange'];

interface ISlot {
  subject_code: string,
  location: string,
  time: string,
};

interface ISlotTranslated {
  text: string,
  classname: string,
};

interface TimetableProps {
  slots: ISlot[],
};

const Timetable: React.FC<TimetableProps> = ({ slots: slots }) => {
  const [data, setData] = useState<ISlotTranslated[]>([]);

  const getPos = (time: number[]) => {
    return `col-start-${time[0]+1} row-start-${time[1]+1} row-end-${time[2]+1}`;
  };

  const getColor = (index: number) => {
    return colors[index % colors.length];
  };

  useEffect(() => {
    let res: ISlotTranslated[] = [];
    for (let i in slots) {
      const slot = slots[i];
      const time = JSON.parse(slot.time);
      for (let t in time) {
        const location = JSON.parse(slot.location);
        const temp: ISlotTranslated = {
          text: `${slot.subject_code} @ ${location[t]}`,
          classname: `${getPos(time[t] as number[])} bg-${getColor(Number(i))}-200 p-4 justify-center items-center flex`,
        };
        res.push(temp);
      }
    }
    setData(res);
  }, [slots]);

  return <>
    {data.map((item, index) => <div key={index} className={item.classname}>
      {item.text}
    </div>)}
  </>;
};

interface ScheduleProps {
  slots: any[]
};

const Schedule: React.FC<ScheduleProps> = ({ slots: slots }) => {
  return <>
    <p className='text-[1.2rem] font-semibold m-[1rem]'>Timetable</p>

    <div className='grid grid-cols-6 grid-rows-[repeat(13,_minmax(0,_1fr))] border bg-base-100'>
      <div className='col-start-1 row-start-1 bg-blue-300 p-4 text-center'>
        Timetable
      </div>
      <div className='col-start-2 row-start-1 bg-blue-100 p-4 text-center'>
        Monday
      </div>
      <div className='col-start-3 row-start-1 bg-blue-200 p-4 text-center'>
        Tuesday
      </div>
      <div className='col-start-4 row-start-1 bg-blue-100 p-4 text-center'>
        Wednesday
      </div>
      <div className='col-start-5 row-start-1 bg-blue-200 p-4 text-center'>
        Thursday
      </div>
      <div className='col-start-6 row-start-1 bg-blue-100 p-4 text-center'>
        Friday
      </div>
      <div className='col-start-1 row-start-2 bg-blue-100 p-4 text-center'>
        0800 - 0845
      </div>
      <div className='col-start-1 row-start-3 bg-blue-200 p-4 text-center'>
        0850 - 0935
      </div>
      <div className='col-start-1 row-start-4 bg-blue-100 p-4 text-center'>
        0950 - 1035
      </div>
      <div className='col-start-1 row-start-5 bg-blue-200 p-4 text-center'>
        1040 - 1125
      </div>
      <div className='col-start-1 row-start-6 bg-blue-100 p-4 text-center'>
        1130 - 1215
      </div>
      <div className='col-start-1 row-start-7 bg-blue-200 p-4 text-center'>
        1400 - 1445
      </div>
      <div className='col-start-1 row-start-8 bg-blue-100 p-4 text-center'>
        1450 - 1535
      </div>
      <div className='col-start-1 row-start-9 bg-blue-200 p-4 text-center'>
        1550 - 1635
      </div>
      <div className='col-start-1 row-start-10 bg-blue-100 p-4 text-center'>
        1640 - 1725
      </div>
      <div className='col-start-1 row-start-11 bg-blue-200 p-4 text-center'>
        1730 - 1815
      </div>
      <div className='col-start-1 row-start-12 bg-blue-100 p-4 text-center'>
        1930 - 2015
      </div>
      <div className='col-start-1 row-start-13 bg-blue-200 p-4 text-center'>
        2020 - 2105
      </div>
      <Timetable slots={slots as ISlot[]} />
    </div>
  </>;
};

export default Schedule;
