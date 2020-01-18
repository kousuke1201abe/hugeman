import React from 'react';
import { getEventsGql, Events } from '../../../common/api/graphql/getEventsGql';
import { useQuery } from 'react-apollo';
import { ClubEvents } from './clubEvents'

export const ClubEventsContainer: React.FC = () => {
  const { loading, error, data } = useQuery<{ events: Events }>(getEventsGql, {
    variables: { name: null, last: 10 }
  },);
  if (error || loading || !data) {
    return <p>{error ? `Error!` : 'loading...'}</p>;
  }
  return(
    <ClubEvents clubEvents={data.events.nodes}/>
  );
}
