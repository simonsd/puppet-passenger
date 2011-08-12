import 'classes/*'

class passenger (
	$webserver = 'httpd',
	$stages = 'no',
	$version = '3.0.8'
) {
	if $stages == 'no' {
	    class{'passenger::packages':} -> class{'passenger::config':}
	} else {
		class {
			'passenger::packages':
				require => 'apache::packages',
				stage => depends;
			'passenger::config':
				require => 'passenger::packages',
				before => 'apache::service',
				stage => config;
		}
	}
}
