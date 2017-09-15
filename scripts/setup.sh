#!/bin/bash 
echo "Waiting for main mongo.."
until mongo "${MONGO1}:27017" --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 1
done
echo "Started.."
echo "send initiate command"
mongo "${MONGO1}:27017" --eval "rs.initiate()"


echo "Waiting for secondary mongo.."
until mongo "${MONGO2}:27017" --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 1
done
echo "Started.."
echo "send add to replicaset command with: '${MONGO2}'"
mongo "${MONGO1}:27017" --eval "rs.add('${MONGO2}')"


echo "Waiting for mongo arb.."
echo "send addArb command with: ${MONGOARB}"
until mongo "${MONGOARB}:27017" --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 1
done
echo "Started.."
echo "send addArb to replicaset command"
mongo "${MONGO1}:27017" --eval "rs.addArb('${MONGOARB}')"