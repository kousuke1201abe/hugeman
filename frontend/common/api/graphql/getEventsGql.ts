import gql from 'graphql-tag';

export const getEventsGql = gql`
  query($name: String, $last: Int) {
    events(name: $name, last: $last) {
      nodes {
        name
        tag
        startAt
        endAt
        nightclub {
          name
        }
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

export type Node = {
  name: string;
  tag: string;
  startAt: string;
  endAt: string;
  nightclub: Nightclub;
}

type Edges = {
  cursor: string;
  node: Node;
}

type Nightclub = {
  name: string;
}

type PageInfo = {
  endCursor: string | null;
  hasNextPage: boolean;
  hasPreviousPage: boolean;
  startCursor: string | null;
}
