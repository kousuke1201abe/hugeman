import { getHelloGql } from '../../../common/api/graphql/helloGql'
import { Query } from 'react-apollo';
import React from 'react';

export const Hello = () => (
  <Query query={getHelloGql}>
    {({ loading, data }) => {
      if (loading) return <p>Loading...</p>;

      return (
        <div>
          { data["hello"] }
        </div>
      );
    }}
  </Query>
);
