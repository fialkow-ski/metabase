#!/usr/bin/env bash
if [ "$PORT" ]; then
  export MB_JETTY_PORT="$PORT"
fi
if [ "$DATABASE_URL" ]; then
  export MB_DB_CONNECTION_URI="$DATABASE_URL"
fi
# Java memory tuning for Heroku
JAVA_OPTS="$JAVA_OPTS -XX:+UnlockExperimentalVMOptions -XX:+UseContainerSupport \\
-XX:-UseGCOverheadLimit -XX:+UseCompressedOops -XX:+UseCompressedClassPointers \\
-Xverify:none -XX:+UseG1GC -XX:+UseStringDeduplication -server \\
-Djava.awt.headless=true -Dfile.encoding=UTF-8"
echo "JAVA_OPTS: $JAVA_OPTS"
export JAVA_OPTS
/app/run_metabase.sh
