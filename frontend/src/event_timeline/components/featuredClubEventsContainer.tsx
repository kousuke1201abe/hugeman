import React, { useState } from 'react';
import { ClubEvents } from './clubEvents'
import { getFeaturedEventsGql, Events } from '../../../common/api/graphql/getFeaturedEventsGql';
import Pagination from "material-ui-flat-pagination";
import { useQuery } from 'react-apollo';
import Container from '@material-ui/core/Container';
import Grid from '@material-ui/core/Grid';
import { makeStyles } from '@material-ui/core/styles';
import Box from '@material-ui/core/Box';
import { Typography, Divider } from '@material-ui/core';
import Alert from '@material-ui/lab/Alert';

export const FeaturedClubEventsContainer: React.FC = () => {
  const useStyles = makeStyles(theme => ({
    clubEventsGrid: {
      paddingTop: theme.spacing(8),
      paddingBottom: theme.spacing(8),
    },
    title: {
      marginBottom: theme.spacing(8),
      fontWeight: "bolder",
      color: "white",
    },
  }));
  const classes = useStyles();

  const [offset, setOffset] = useState(0);

  const handleClickPagination = (offset) => {
    setOffset(offset)
  }

  const { loading, error, data } = useQuery<{ featuredEvents: Events }>(getFeaturedEventsGql, {
    variables: { name: null }
  },);
  if (error || loading || !data) {
    return <p>{error ? `Error!` : 'loading...'}</p>;
  }

  const events = data.featuredEvents.nodes.slice(offset, 10 + offset);

  if (events.length === 0) {
    return(
      <div>
        <Container className={classes.clubEventsGrid} maxWidth="md">
          <Typography align="center" variant="h4" component="h2" className={classes.title}>
            Today's Events
          </Typography>
          <Alert severity="info">本日開催のイベントがありません</Alert>
        </Container>
      </div>
      )
  } else {
    return(
      <div>
        <Container className={classes.clubEventsGrid} maxWidth="md">
          <Typography align="center" variant="h4" component="h2" className={classes.title}>
            Today's Events
          </Typography>
          <ClubEvents clubEvents={events}/>
          <Grid container justify="center">
            <Box mt={7}>
              <Pagination
                limit={10}
                offset={offset}
                total={data.featuredEvents.nodes[0].totalCount}
                onClick={(e, offset) => handleClickPagination(offset)}
              />
            </Box>
          </Grid>
        </Container>
      </div>
    );
  }
}
