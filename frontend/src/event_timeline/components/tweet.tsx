import Grid from '@material-ui/core/Grid';
import React from 'react';
import { TwitterTweetEmbed } from 'react-twitter-embed';


export type TweetProps = {
  id: string;
}

export const Tweet = ({tweet}: any) => {
  return(
    <Grid item xs={12} sm={12} md={12}>
      <TwitterTweetEmbed
        tweetId={tweet.id}
        onLoad={onload}
      />
    </Grid>
  )
}
