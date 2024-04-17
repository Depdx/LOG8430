rs.initiate(
    {
        _id: "rs-shard-0",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_0:27017" },
            { _id: 1, host: "mongodb_replica_node_0_0:27017" },
            { _id: 2, host: "mongodb_replica_node_0_1:27017" }
        ]
    }
)
