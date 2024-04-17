rs.initiate(
    {
        _id: "rs-shard-1",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_1:27017" },
            { _id: 1, host: "mongodb_replica_node_1_0:27017" },
            { _id: 2, host: "mongodb_replica_node_1_1:27017" }
        ]
    }
)
