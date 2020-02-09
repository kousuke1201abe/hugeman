import React from 'react';
import reactDom from 'react-dom';
import { ApolloProvider } from 'react-apollo';
import { client } from '../../common/api/graphql/apolloClient';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import { Navbar } from './components/navbar'
import { FeaturedClubEventsContainer } from './components/featuredClubEventsContainer';
import { ArchivedClubEventsContainer } from './components/archivedClubEventsContainer';
import { ScheduledClubEventsContainer } from './components/scheduledClubEventsContainer';

const renderTimeline = () => {
  reactDom.render(
    <ApolloProvider client={client}>
      <Router>
        <Route exact path='/' component={FeaturedClubEventsContainer} />
        <Route exact path='/scheduled' component={ScheduledClubEventsContainer} />
        <Route exact path='/archived' component={ArchivedClubEventsContainer} />
        <Navbar></Navbar>
      </Router>
    </ApolloProvider>,
    document.getElementById('root')
  );
};

export default renderTimeline;
