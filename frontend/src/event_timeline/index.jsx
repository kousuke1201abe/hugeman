import React from 'react';
import {render} from 'react-dom';

class App extends React.Component {
  render () {
    return <p> Hello React!</p>;
  }
}

const renderTimeline = () => {
  render(
    <App/>,
    document.getElementById('root')
  );
};

export default renderTimeline;
