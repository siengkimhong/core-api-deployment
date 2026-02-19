#!/bin/bash

KEYCLOAK_DATA_DIR="/opt/keycloak/data"
REALM_FILE="realm-core-api.json"
IMPORT_DIR="$KEYCLOAK_DATA_DIR/import"

# Only import if realm config doesn't already exist
if [ ! -f "$KEYCLOAK_DATA_DIR/realm-imported.flag" ]; then
  echo "🟡 First-time run: importing realm..."
  mkdir -p $IMPORT_DIR
  cp /realm-config/$REALM_FILE $IMPORT_DIR/

  /opt/keycloak/bin/kc.sh import --dir=$IMPORT_DIR --override=true --file=$REALM_FILE

  touch "$KEYCLOAK_DATA_DIR/realm-imported.flag"
  echo "✅ Realm imported."
fi

# Start Keycloak in dev mode
exec /opt/keycloak/bin/kc.sh start-dev --http-port=9191
