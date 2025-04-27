import React, { useState, useEffect } from 'react';
import { getUserProfile } from '@/hooks/user';

interface IProfile {
  id: string,
  name: string,
  college: string,
  major: string,
  year: string,
  nationality: string,
  contact: string,
  picture: string,
};

const Profile: React.FC = () => {
  const [profile, setProfile] = useState<IProfile | null>(null);

  useEffect(() => {
    (async () => {
      const data = await getUserProfile();
      setProfile(data ? data as IProfile : null)
    })();
  }, []);

  return <>
    <p className='text-[1.2rem] font-semibold m-[1rem]'>Student Information</p>

    <div className='w-full bg-base-100 flex p-[1rem] mb-[2rem] border-box rounded-[0.5rem] shadow-lg'>
      <div className='w-[30%] flex flex-col justify-center items-center'>
        <div className='avatar mb-[1rem]'>
          <div className='w-32 rounded'>
            <img src={profile?.picture ?? '/profpic.jpeg'} />
          </div>
        </div>
        <p className='font-black'>{profile?.id}</p>
        <p className='font-semibold uppercase'>{profile?.name}</p>
      </div>

      <div className='w-[70%] flex flex-col justify-center items-center'>
        <table className='table'>
          <tbody>
            <tr>
              <td>College</td>
              <td className='uppercase'>{profile?.college}</td>
            </tr>
            <tr>
              <td>Major</td>
              <td className='uppercase'>{profile?.major}</td>
            </tr>
            <tr>
              <td>Year</td>
              <td>{profile?.year}</td>
            </tr>
            <tr>
              <td>Nationality</td>
              <td className='uppercase'>{profile?.nationality}</td>
            </tr>
            <tr>
              <td>Contact Number</td>
              <td>{profile?.contact}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </>;
};

export default Profile;
