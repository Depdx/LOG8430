docker compose up -d

# wait for the cluster to be up
sleep 20

# bootstrap the cluster
echo "Bootstrapping the cluster"
sh -c ./scripts/bootstrap_cluster.sh
echo "Cluster bootstrapped"

echo "To stop the cluster run: docker compose down"
