import Grid from '@material-ui/core/Grid';
import { ClubEvent } from './clubEvent';
import React from 'react';
import { Nodes } from '../../../common/api/graphql/getFeaturedEventsGql'

type ClubEvents = {
  clubEvents: Nodes;
}

export const ClubEvents = ({clubEvents}: ClubEvents) => {
  return (
    <Grid container spacing={4}>
      {clubEvents.map(clubEvent => (
        <ClubEvent clubEvent={clubEvent}/>
      ))}
    </Grid>
  )
}
