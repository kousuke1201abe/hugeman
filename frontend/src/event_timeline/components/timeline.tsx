import Grid from '@material-ui/core/Grid';
import { Tweet } from './tweet';
import React from 'react';
import { createStyles, makeStyles, Theme } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import { getEventGql, Event } from '../../../common/api/graphql/getEventGql';
import { useQuery } from 'react-apollo';

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      flexGrow: 1,
    },
    title: {
      flexGrow: 1,
    },
  }),
);

export const Timeline = (props: any) => {
  const classes = useStyles();

  const { loading, error, data } = useQuery<{ event: Event }>(getEventGql, {
    variables: { urlCode: props.match.params.id }
  },);
  if (error || loading || !data) {
    return <p>{error ? `Error!` : 'loading...'}</p>;
  }

  return (
    <div>
      <AppBar position="fixed" style={{backgroundColor: "#424242"}}>
        <Toolbar>
          <Typography variant="h6" className={classes.title}>
            Timeline
          </Typography>
        </Toolbar>
      </AppBar>
      <div style={{ padding: 20, marginTop: 50, marginBottom: 50 }}>
        <Grid container style={{margin: "auto", maxWidth: 500}}>
          {data.event.tweets.map(tweet => (
            <Tweet tweet={tweet} key={tweet.code}/>
          ))}
        </Grid>
      </div>
    </div>
  )
}
