import gql from 'graphql-tag';
import { FetchResult } from 'apollo-link';

export const getHelloGql = gql`
  {
    hello
  }
`;


export type Hello = String;

export type GetHelloResponse = FetchResult<{
  hello: Hello;
}>;
