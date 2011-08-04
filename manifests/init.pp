import 'classes/*'

class passenger (
	$webserver = 'httpd'
) {
    class{'passenger::packages':} -> class{'passenger::config':}
}
