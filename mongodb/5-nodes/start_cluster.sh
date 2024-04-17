sudo rm -rf data
sudo rm -rf config
docker compose up -d

# wait for the cluster to be up
sleep 55

# bootstrap the cluster
echo "Bootstrapping the cluster"
sh -c ./scripts/bootstrap_cluster.sh
echo "Cluster bootstrapped"

# wait for the cluster to be up
sleep 5

echo "To stop the cluster run: docker compose down"
