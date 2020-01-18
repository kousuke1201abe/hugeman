import React from 'react';
import * as reactDom from 'react-dom';
import { ApolloProvider } from 'react-apollo';
import { client } from '../../common/api/graphql/apolloClient';
import { App } from './components/app';

const renderTimeline = () => {
  reactDom.render(
    <ApolloProvider client={client}>
      <App/>
    </ApolloProvider>,
    document.getElementById('root')
  );
};

export default renderTimeline;
