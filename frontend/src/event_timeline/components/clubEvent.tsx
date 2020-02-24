import Typography from '@material-ui/core/Typography';
import Card from '@material-ui/core/Card';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Grid from '@material-ui/core/Grid';
import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import { Node } from '../../../common/api/graphql/getFeaturedEventsGql'
import { Link } from 'react-router-dom';

const useStyles = makeStyles(theme => ({
  card: {
    height: '100%',
    display: 'flex',
    flexDirection: 'column',
    '&:hover': {
      opacity: "0.5",
   },
  },
  cardMedia: {
    paddingTop: '56.25%', // 16:9
  },
  cardContent: {
    flexGrow: 1,
  },
}));

export type ClubEvent = {
  clubEvent: Node;
}

export const ClubEvent = ({clubEvent}: ClubEvent) => {
  const classes = useStyles();
  return(
      <Grid item key={clubEvent.name} xs={12} sm={6} md={4}>
        <Link to={`/events/${clubEvent.urlCode}/timeline`} style={{ textDecoration: 'none' }}>
          <Card className={classes.card}>
            <CardMedia
              className={classes.cardMedia}
              image="https://static.camp-fire.jp/uploads/project_activity/image/67297/a5_omote_2.jpg"
              title="Image title"
            />
            <CardContent className={classes.cardContent}>
              <Typography gutterBottom variant="h5" component="h2">
                {clubEvent.name}
              </Typography>
              <Typography variant="caption" component="small">
                {clubEvent.tag}
              </Typography>
              <Typography variant="caption" component="small">
                {clubEvent.startAt}
              </Typography>
              <Typography variant="caption" component="small">
                {clubEvent.endAt}
              </Typography>
            </CardContent>
          </Card>
        </Link>
      </Grid>
  )
}
