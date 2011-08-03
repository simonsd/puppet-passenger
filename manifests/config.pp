class passenger::config {
  file {
    "/etc/$webserver/conf.d/passenger.conf":
      content => template('passenger/passenger.conf'),
      mode => 644,
      owner=> root,
      group => root,
      notify => Service ["$webserver"],
  }
}
