#/bin/sh

# Waiting for mysql container to be setup
echo "Waiting for mysql container..."

# Changer de méthode. Requete http ????????
sleep 35

cd /opt/drupal

# Perform Drupal site installation using Drush
drush si demo_umami -y --site-name="drupal" --account-name=${DRUPAL_USER} --account-pass=${DRUPAL_PASSWORD} --db-url=mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@${DATABASE_HOST}/${MYSQL_DATABASE}
#drush si demo_umami -y --site-name="{{ drupal }}" --account-name="{{ admin }}" --account-pass=admin --db-url=mysql://admin:admin1234@drupaldb2.csingpkxfz9v.eu-west-1.rds.amazonaws.com/drupaldb2 

drush pm:install jsonapi
drush pm:install basic_auth
drush config:delete jsonapi.settings read_only

apache2-foreground