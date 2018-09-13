DOMAIN_NAME=$1
DOMAIN_CONFIG_SCRIPT=$2

if [ -z "$DOMAIN_NAME" ]
  then
    DOMAIN_NAME="default"
fi

ADMIN_PORT=4848

echo "Creating domain $DOMAIN_NAME with admin port $ADMIN_PORT"

asadmin --user admin --passwordfile glassfish.passwords create-domain --keytooloptions CN=localhost ${DOMAIN_NAME}

echo "Create domain finished"

if [ ! $? -eq 0 ]
  then
    echo "Creating domain failed, aborting script"
    exit 1
fi


# add domain to be started when image is started
mkdir /etc/service/glassfish-domain-${DOMAIN_NAME}
cat >/etc/service/glassfish-domain-${DOMAIN_NAME}/run <<EOL
#!/bin/sh
asadmin start-domain --debug -v ${DOMAIN_NAME}
EOL
chmod +x /etc/service/glassfish-domain-${DOMAIN_NAME}/run

# start the domain and enable remote admistration
asadmin start-domain ${DOMAIN_NAME}
asadmin --user admin --passwordfile glassfish.passwords --port ${ADMIN_PORT} enable-secure-admin

# run domain custom configuration here
if [ -n "$DOMAIN_CONFIG_SCRIPT" ]
  then
    source ${DOMAIN_CONFIG_SCRIPT}
fi

# stop domain
asadmin stop-domain ${DOMAIN_NAME}