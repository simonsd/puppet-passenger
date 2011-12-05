class passenger::packages {
  package {
    "rubygem-passenger": 
      ensure => "$passenger::version",
      name => passenger,
      provider => gem,
      require => $::operatingsystem ? {
        default => Package["$passenger::webserver"],
        archlinux => Package["apache"],
        debian => Package["apache"],
      },
      before => Service["$passenger::webserver"];

    'curl-devel':
      ensure => installed,
      name => $::operatingsystem ? {
        archlinux => 'curl',
        centos => 'libcurl-devel',
        debian => 'libcurl4-openssl-dev',
      };
  }
}
