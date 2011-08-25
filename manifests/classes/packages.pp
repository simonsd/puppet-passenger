class passenger::packages {
  package {
    "rubygem-passenger": 
       ensure => "$passenger::version",
       name => passenger,
       provider => gem,
       require => Package["$passenger::webserver", "$passenger::webserver-devel"],
       before => Service["$passenger::webserver"];
  }
}
