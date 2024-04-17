rs.initiate(
    {
        _id: "rs-shard-4",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_4:27017" },
            { _id: 1, host: "mongodb_replica_node_4_0:27017" },
            { _id: 2, host: "mongodb_replica_node_4_1:27017" }
        ]
    }
)
