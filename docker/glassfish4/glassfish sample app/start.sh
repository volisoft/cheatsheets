#!/bin/sh

asadmin start-domain app_domain
echo 'Deploying application'
asadmin --user admin --passwordfile glassfish.passwords --interactive=false deploy /$APP_FILE
asadmin stop-domain app_domain
asadmin start-domain --verbose app_domain