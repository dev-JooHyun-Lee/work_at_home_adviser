#!/bin/bash
## - executes any *.sh script found in /docker-entrypoint-initdb.d
## - executes any *.cql script found in docker-entrypoint-initdb.d after booting cassandra up

set -e

for f in docker-entrypoint-initdb.d/*; do
    case "$f" in
        *.sh)     echo "$0: running $f"; . "$f" ;;
        *.cql)    echo "$0: running $f" && until cqlsh -f "$f"; do >&2 echo "Cassandra is unavailable - sleeping"; sleep 2; done & ;;
        *)        echo "$0: ignoring $f" ;;
    esac
    echo
done

exec docker-entrypoint.sh "$@"