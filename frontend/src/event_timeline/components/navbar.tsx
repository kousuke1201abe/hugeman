import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import BottomNavigation from '@material-ui/core/BottomNavigation';
import BottomNavigationAction from '@material-ui/core/BottomNavigationAction';
import HistoryIcon from '@material-ui/icons/History';
import EventAvailableIcon from '@material-ui/icons/EventAvailable';
import ScheduleIcon from '@material-ui/icons/Schedule';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';

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
      <Toolbar>
        <BottomNavigation
          value={value}
          onChange={(event, newValue) => {
            setValue(newValue);
          }}
          showLabels
          className={classes.root}
        >
          <BottomNavigationAction label="開催中" icon={<EventAvailableIcon />} />
          <BottomNavigationAction label="開催予定" icon={<ScheduleIcon />} />
          <BottomNavigationAction label="アーカイブ" icon={<HistoryIcon />} />
        </BottomNavigation>
      </Toolbar>
    </AppBar>
  );
}
