import gql from 'graphql-tag';

export const getFeaturedEventsGql = gql`
  query {
    featuredEvents {
      edges {
        cursor
        node {
          name
        }
      }
      nodes {
        name
        tag
        startAt
        endAt
        urlCode
        nightclub {
          name
        }
        totalCount
      }
      pageInfo {
        endCursor
        hasNextPage
        hasPreviousPage
        startCursor
      }
    }
  }
`;

export type Events = {
  edges: Edges;
  nodes: Nodes;
  pageInfo: PageInfo;
}

export type Nodes = Node[];

export type Edges = {
  cursor: string;
  node: {
    name: string;
  }
}

export type Node = {
  name: string;
  tag: string;
  startAt: string;
  endAt: string;
  urlCode: string;
  nightclub: Nightclub;
  totalCount: number;
}

type Edges = {
  cursor: string;
  node: Node;
}

type Nightclub = {
  name: string;
}

export type PageInfo = {
  endCursor: string | null;
  hasNextPage: boolean;
  hasPreviousPage: boolean;
  startCursor: string | null;
}
