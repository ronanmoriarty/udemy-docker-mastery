docker network create --driver overlay frontend
docker network create --driver overlay backend

docker service create --name db --replicas 1 --network backend -e POSTGRES_HOST_AUTH_METHOD=trust --mount type=volume,source=db-data,target=/var/lib/postgresql/data postgres:9.4

docker service create --name redis --replicas 1 --network frontend redis:3.2

docker service create --name worker --network backend --network frontend --replicas 1 bretfisher/examplevotingapp_worker:java

docker service create --name vote --replicas 2 --network frontend -p 80:80 bretfisher/examplevotingapp_vote

docker service create --name result --replicas 1 --network backend -p 5001:80 bretfisher/examplevotingapp_result