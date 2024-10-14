#!/bin/bash
set -e

# Default title if not provided
TITLE=${TITLE:-"We'll Be Back Soon!"}
MESSAGE="${MESSAGE:-Sorry for the inconvenience but we're performing some maintenance at the moment. We'll be back online shortly!}"
CONTACT_EMAIL="${CONTACT_EMAIL:-support@example.com}"
TEAM_MESSAGE="${TEAM_MESSAGE:-BBMRI-ERIC IT Team}"
# Replace the placeholder with the environment variable
sed -i "s/\${TITLE}/$TITLE/g" /app/index.html
sed -i "s/\${MESSAGE}/$MESSAGE/g" /app/index.html
sed -i "s/\${CONTACT_EMAIL}/$CONTACT_EMAIL/g" /app/index.html
sed -i "s/\${TEAM_MESSAGE}/$TEAM_MESSAGE/g" /app/index.html

# Start Nginx
exec nginx -g "daemon off;"
