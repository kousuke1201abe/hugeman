import React from 'react';
import * as reactDom from 'react-dom';

class App extends React.Component {
  render () {
    return <p> Hello React!</p>;
  }
}

const renderTimeline = () => {
  reactDom.render(
    <App/>,
    document.getElementById('root')
  );
};

export default renderTimeline;
