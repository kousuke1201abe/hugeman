import React from 'react';
import reactDom from 'react-dom';
import { ApolloProvider } from 'react-apollo';
import { client } from '../../common/api/graphql/apolloClient';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import { Navbar } from './components/navbar'
import { FeaturedClubEventsContainer } from './components/featuredClubEventsContainer';
import { ArchivedClubEventsContainer } from './components/archivedClubEventsContainer';
import { ScheduledClubEventsContainer } from './components/scheduledClubEventsContainer';
import { MuiThemeProvider } from '@material-ui/core/styles';
import { createMuiTheme } from '@material-ui/core/styles';
import blue from '@material-ui/core/colors/blue';
import yellow from '@material-ui/core/colors/yellow';

export const theme = createMuiTheme({
  palette: {
    type: 'dark', // ベースのテーマ lightかdarkか
    primary: blue, // primaryのカラー
    secondary: yellow, // secondaryのカラー
  },
});

const renderTimeline = () => {
  reactDom.render(
    <ApolloProvider client={client}>
      <MuiThemeProvider theme={theme} >
      <Router>
        <Route exact path='/' component={FeaturedClubEventsContainer} />
        <Route exact path='/scheduled' component={ScheduledClubEventsContainer} />
        <Route exact path='/archived' component={ArchivedClubEventsContainer} />
        <Navbar></Navbar>
      </Router>
      </MuiThemeProvider>
    </ApolloProvider>,
    document.getElementById('root')
  );
};

export default renderTimeline;
