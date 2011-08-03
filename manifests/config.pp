class passenger::config {
  file {
    'passenger.conf':
       path => $operatingsystem ? {
           centos => "/etc/httpd/conf.d/passenger.conf",
           debian => "/etc/apache2/conf.d/passenger.conf",
       },
       content => template('passenger/passenger.conf'),
       mode => 644,
       owner=> root,
       group => root,
       notify => Service ["$webserver"],
  }
}
