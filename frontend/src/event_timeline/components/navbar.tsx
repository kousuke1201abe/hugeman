import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import BottomNavigation from '@material-ui/core/BottomNavigation';
import BottomNavigationAction from '@material-ui/core/BottomNavigationAction';
import HistoryIcon from '@material-ui/icons/History';
import EventAvailableIcon from '@material-ui/icons/EventAvailable';
import ScheduleIcon from '@material-ui/icons/Schedule';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import { Link } from 'react-router-dom';

const useStyles = makeStyles({
  root: {
    width: '100%',
  },
  appBar: {
    top: 'auto',
    bottom: 0,
    backgroundColor: 'white',
  },
});

export const Navbar = () => {
  const classes = useStyles();
  const [value, setValue] = React.useState(0);

  return (
    <AppBar position="fixed" className={classes.appBar}>
      <BottomNavigation
        value={value}
        onChange={(event, newValue) => {
          setValue(newValue);
        }}
        showLabels
        className={classes.root}
      >
        <BottomNavigationAction component={Link} to="/" label="本日開催" icon={<EventAvailableIcon />} />
        <BottomNavigationAction component={Link} to="/scheduled" label="開催予定" icon={<ScheduleIcon />} />
        <BottomNavigationAction component={Link} to="/archived" label="アーカイブ" icon={<HistoryIcon />} />
      </BottomNavigation>
    </AppBar>
  );
}
