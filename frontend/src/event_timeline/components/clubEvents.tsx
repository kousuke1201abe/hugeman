import Grid from '@material-ui/core/Grid';
import { makeStyles } from '@material-ui/core/styles';
import Container from '@material-ui/core/Container';
import { ClubEvent } from './clubEvent';
import React from 'react';
import { Nodes } from '../../../common/api/graphql/getEventsGql'

const useStyles = makeStyles(theme => ({
  cardGrid: {
    paddingTop: theme.spacing(8),
    paddingBottom: theme.spacing(8),
  },
}));

type ClubEvents = {
  clubEvents: Nodes;
}

export const ClubEvents = ({clubEvents}: ClubEvents) => {
  const classes = useStyles();
  return (
  <Container className={classes.cardGrid} maxWidth="md">
    <Grid container spacing={4}>
      {clubEvents.map(clubEvent => (
        <ClubEvent clubEvent={clubEvent}/>
      ))}
    </Grid>
  </Container>
  )
}
