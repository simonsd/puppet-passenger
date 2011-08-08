class passenger::packages {
  package {
    "rubygem-passenger": 
       ensure => $operatingsystemrelease ? {
            '6.0' => "2.2.7",
            '*' => "2.2.2-1",
       },
       name => passenger,
       provider => gem,
       require => Package["$webserver"],
       before => Service["$webserver"];
  }
}
