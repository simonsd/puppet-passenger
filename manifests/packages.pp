class passenger::packages {
  package {
    "rubygem-passenger": 
       ensure => $operatingsystemrelease ? {
            6.0 => "latest",
            * => "2.2.2-1",
       },
       require => Package["$webserver"],
       before => Service["$webserver"],
  }
}
