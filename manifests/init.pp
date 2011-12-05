import 'classes/*'

class passenger (
	$webserver = 'httpd',
	$version = '3.0.8'
) {
    class {
		'passenger::packages':
			before => Class['passenger::config'];
		'passenger::config':;
	}

    Exec{path=>'/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin'}
}
