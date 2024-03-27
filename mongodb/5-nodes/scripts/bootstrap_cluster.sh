echo "Initializing config servers"
docker-compose exec -T configserver sh -c "mongosh < ./scripts/init-config-server.js"
echo "Initializing node 0"
docker-compose exec -T mongodb_node_0 sh -c "mongosh < ./scripts/init-shard-0.js"
echo "Initializing node 1"
docker-compose exec -T mongodb_node_1 sh -c "mongosh < ./scripts/init-shard-1.js"
echo "Initializing node 2"
docker-compose exec -T mongodb_node_2 sh -c "mongosh < ./scripts/init-shard-2.js"
echo "Initializing node 3"
docker-compose exec -T mongodb_node_3 sh -c "mongosh < ./scripts/init-shard-3.js"
echo "Initializing node 4"
docker-compose exec -T mongodb_node_4 sh -c "mongosh < ./scripts/init-shard-4.js"
echo "Iniliazing router"
docker-compose exec -T router sh -c "mongosh < ./scripts/init-router.js"
