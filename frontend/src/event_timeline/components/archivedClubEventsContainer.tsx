import React, { useState } from 'react';
import { ClubEvents } from './clubEvents'
import { getArchivedEventsGql, Events } from '../../../common/api/graphql/getArchivedEventsGql';
import Pagination from "material-ui-flat-pagination";
import { useQuery } from 'react-apollo';
import Container from '@material-ui/core/Container';
import Grid from '@material-ui/core/Grid';
import { makeStyles } from '@material-ui/core/styles';
import Box from '@material-ui/core/Box';

export const ArchivedClubEventsContainer: React.FC = () => {
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

  const { loading, error, data } = useQuery<{ archivedEvents: Events }>(getArchivedEventsGql, {
    variables: { name: null }
  },);
  if (error || loading || !data) {
    return <p>{error ? `Error!` : 'loading...'}</p>;
  }

  const events = data.archivedEvents.nodes.slice(offset, 10 + offset);

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
                total={data.archivedEvents.nodes[0].totalCount}
                onClick={(e, offset) => handleClickPagination(offset)}
              />
            </Box>
          </Grid>
        </Container>
      </div>
    );
  }
}
