sudo rm -rf data
docker compose up -d

# wait for the cluster to be up
sleep 20

echo "To stop the cluster run: docker compose down"
