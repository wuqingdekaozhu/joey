import React, { useState, useEffect } from 'react';
import { getNotifications } from '@/hooks/parameters';

interface Notification {
  title: string,
  description: string,
  link: string,
  group: string,
};

const SideBar: React.FC = () => {
  const [notifications, setNotifications] = useState<Notification[]>([]);

  useEffect(() => {
    (async () => {
      const data = await getNotifications();
      setNotifications(data as Notification[]);
    })();
  }, []);

  return <>
    <p className='text-[1.2rem] font-semibold m-[1rem]'>Pending Tasks</p>

    {notifications.map((item, index) => item.group === 'NOTIFICATION' &&
      <div className='card w-full bg-base-100 card-sm shadow-sm mb-[1rem]' key={index}>
        <div className='card-body'>
          <h2 className='card-title'>{item.title}</h2>
          <p>{item.description}</p>
          <div className='justify-end card-actions'>
            <a href={item.link} target='_blank' className='btn btn-primary'>Learn More</a>
          </div>
        </div>
      </div>
    )}

    <div className="divider"></div>

    <p className='text-[1.2rem] font-semibold m-[1rem]'>Upcoming Events</p>

    {notifications.map((item, index) => item.group === 'EVENT' &&
      <div className='card w-full bg-base-100 card-sm shadow-sm mb-[1rem]' key={index}>
        <div className='card-body'>
          <h2 className='card-title'>{item.title}</h2>
          <p>{item.description}</p>
          <div className='justify-end card-actions'>
            <a href={item.link} target='_blank' className='btn btn-primary'>Learn More</a>
          </div>
        </div>
      </div>
    )}
  </>;
};

export default SideBar;
