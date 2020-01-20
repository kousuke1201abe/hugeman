import React from 'react';
import reactDom from 'react-dom';
import { ApolloProvider } from 'react-apollo';
import { client } from '../../common/api/graphql/apolloClient';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import { App } from './components/app';

const renderTimeline = () => {
  reactDom.render(
    <ApolloProvider client={client}>
      <Router>
        <Route exact path='/' component={App} />
      </Router>
    </ApolloProvider>,
    document.getElementById('root')
  );
};

export default renderTimeline;
