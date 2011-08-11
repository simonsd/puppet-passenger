class passenger::packages {
  package {
    "rubygem-passenger": 
       ensure => "$version",
       name => passenger,
       provider => gem,
       require => Package["$webserver"],
       before => Service["$webserver"];
  }
}
