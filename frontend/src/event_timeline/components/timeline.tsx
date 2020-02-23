import Grid from '@material-ui/core/Grid';
import { Tweet } from './tweet';
import React from 'react';
import { createStyles, makeStyles, Theme } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';

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

export const Timeline = () => {
  const classes = useStyles();
  const tweets = [
    { id: '1231591290741182470' },
    { id: '1231581835861184512' },
    { id: '1231587654388441088' },
    { id: '933354946111705097' },
    { id: '933354946111705097' },
    { id: '933354946111705097' }
  ]

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
          {tweets.map(tweet => (
            <Tweet tweet={tweet} key={tweet.id}/>
          ))}
        </Grid>
      </div>
    </div>
  )
}
