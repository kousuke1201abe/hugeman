import gql from 'graphql-tag';

export const getEventGql = gql`
  query($urlCode: String!) {
    event(urlCode: $urlCode) {
      tweets {
        code
      }
    }
  }
`;

export type Event = {
  tweets: Tweet[];
}

export type Tweet = {
  code: string;
}
