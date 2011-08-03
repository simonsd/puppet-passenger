class passenger::config {
  file {
    "/etc/$webserver/conf.d/passenger.conf":
      content => template('modules/passenger/passenger.conf'),
      mode => 644,
      owner=> root,
      group => root,
      notify => Service ["$webserver"],
  }
}
