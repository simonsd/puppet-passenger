import 'classes/*'

class passenger (
	$webserver = 'httpd',
	$version = '3.0.8'
) {
    class {
		'passenger::packages':;
		'passenger::config':
			require => Class['passenger::packages'];
	}

    Exec{path=>'/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin'}
}
