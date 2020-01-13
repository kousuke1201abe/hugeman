import React from 'react';
import * as reactDom from 'react-dom';
import { ApolloProvider } from 'react-apollo';
import { client } from '../../common/api/graphql/apolloClient';
import { Hello } from '../event_timeline/components/hello';

class App extends React.Component<any, any> {
  render () {
    return(
      <div>
        <Hello/>
      </div>
    );
  }
}

const renderTimeline = () => {
  reactDom.render(
    <ApolloProvider client={client}>
      <App/>
    </ApolloProvider>,
    document.getElementById('root')
  );
};

export default renderTimeline;
