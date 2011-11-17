class passenger::packages {
  package {
    "rubygem-passenger": 
       ensure => "$passenger::version",
       name => passenger,
       provider => gem,
       require => $::operatingsystem ? {
			default => Package["$passenger::webserver", "$passenger::webserver-devel"],
			archlinux => Package["apache"],
			debian => Package["apache"],
       },
       before => Service["$passenger::webserver"];
  }
}
