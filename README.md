# createHostNginx

Shell Script to create a host into Nginx for Mac and open with Sublime Text.

For execute this script use ``sudo /path/createHostNginx.sh hostName userPermissionNeed``

Pre-requisites sudo permission, "Sublime Text 3" and nginx into directory /usr/local/etc/nginx/

This host is available to open in browser with address insered on ``hostName``  script parameter.

Example:

If i execute ``sudo /path/createHostNginx.sh mysite.dev lucascasotti`` on terminal, on browser may write this ``http://mysite.dev/`` for open
