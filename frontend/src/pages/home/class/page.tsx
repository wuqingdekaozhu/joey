import Class from '@/components/class';
import React from 'react';
import { useSearchParams } from 'react-router-dom';

const ClassPage: React.FC = () => {
  const [searchParams] = useSearchParams();
  const id = searchParams.get('id');

  if (!id) return <></>;

  return <>
    <Class id={Number(id)} />
  </>;
};

export default ClassPage;
