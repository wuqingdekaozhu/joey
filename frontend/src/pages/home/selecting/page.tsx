import React, { useState, useEffect } from 'react';
import { useSearchParams } from 'react-router-dom';
import { getParameter } from '@/hooks/parameters';
import Search from '@/components/search';

const SelectingPage: React.FC = () => {
  const [searchParams] = useSearchParams();
  const query = searchParams.get('query');

  const [isSelectionOpen, setIsSelectionOpen] = useState(false);

  useEffect(() => {
    (async () => {
      const data = await getParameter('isSelectionOpen');
      if (data.value === 'true') {
        setIsSelectionOpen(true);
      }
    })();
  }, []);
  
  return <>
    {isSelectionOpen && <Search query={query ?? ''} />}
  </>;
};

export default SelectingPage;
