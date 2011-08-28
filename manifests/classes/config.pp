class passenger::config {
  file {
    'passenger.conf':
       path => $::operatingsystem ? {
           archlinux => '/etc/httpd/conf/passenger.conf',
           centos => "/etc/httpd/conf.d/passenger.conf",
           debian => "/etc/apache2/conf.d/passenger.conf",
       },
       content => template('passenger/passenger.conf.erb'),
       mode => 644,
       owner=> root,
       group => root,
       notify => Service ["$passenger::webserver"],
  }

  exec {
	'install modules':
		command => 'passenger-install-apache2-module --auto',
		unless => "ls $ruby::lib_dir/gem/1.9.1/gems/passenger-$passenger::version/ext/apache2/mod_passenger.so";
  }
}
