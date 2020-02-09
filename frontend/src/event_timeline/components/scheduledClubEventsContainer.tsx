import React, { useState } from 'react';
import { ClubEvents } from './clubEvents'
import { getScheduledEventsGql, Events } from '../../../common/api/graphql/getScheduledEventsGql';
import Pagination from "material-ui-flat-pagination";
import { useQuery } from 'react-apollo';
import Container from '@material-ui/core/Container';
import Grid from '@material-ui/core/Grid';
import { makeStyles } from '@material-ui/core/styles';
import Box from '@material-ui/core/Box';

export const ScheduledClubEventsContainer: React.FC = () => {
  const useStyles = makeStyles(theme => ({
    clubEventsGrid: {
      paddingTop: theme.spacing(8),
      paddingBottom: theme.spacing(8),
    },
  }));
  const classes = useStyles();

  const [offset, setOffset] = useState(0);

  const handleClickPagination = (offset) => {
    setOffset(offset)
  }

  const { loading, error, data } = useQuery<{ scheduledEvents: Events }>(getScheduledEventsGql, {
    variables: { name: null }
  },);
  if (error || loading || !data) {
    return <p>{error ? `Error!` : 'loading...'}</p>;
  }

  const events = data.scheduledEvents.nodes.slice(offset, 10 + offset);

  if (events.length === 0) {
    return(
      <div>イベントがありません</div>
    )
  }
  else {
    return(
      <div>
        <Container className={classes.clubEventsGrid} maxWidth="md">
          <ClubEvents clubEvents={events}/>
          <Grid container justify="center">
            <Box mt={7}>
              <Pagination
                limit={10}
                offset={offset}
                total={data.scheduledEvents.nodes[0].totalCount}
                onClick={(e, offset) => handleClickPagination(offset)}
              />
            </Box>
          </Grid>
        </Container>
      </div>
    );
  }
}
