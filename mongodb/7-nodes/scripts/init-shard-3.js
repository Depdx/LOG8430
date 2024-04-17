rs.initiate(
    {
        _id: "rs-shard-3",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_3:27017" },
            { _id: 1, host: "mongodb_replica_node_3_0:27017" },
            { _id: 2, host: "mongodb_replica_node_3_1:27017" }
        ]
    }
)
