docker pull mongo

docker run  \
--name mongodb \
-p 2225:27017  \
-v /data/mongo/configdb:/data/configdb/ \
-v /data/mongo/db/:/data/db/ \
-d mongo --auth
