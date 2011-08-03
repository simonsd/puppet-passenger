class passenger::puppet {



package  { "rubygem-rack":
		ensure => installed 
}


file {
	"/etc/$webserver/conf.d/puppetmaster.conf":
		content => template('passenger/puppetmaster.conf.erb'),
	  	notify => Service["$webserver"];

	"/usr/share/puppet/rack":
		ensure => directory;
	"/usr/share/puppet/rack/puppetmasterd":
		ensure => directory;
	"/usr/share/puppet/rack/puppetmasterd/public": 
		ensure => directory;
	"/usr/share/puppet/rack/puppetmasterd/tmp":
		ensure => directory;
	"/usr/share/puppet/rack/puppetmasterd/config.ru":
		source => "/usr/share/puppet/ext/rack/files/config.ru",
		owner => puppet;
	}



}
