rs.initiate(
    {
        _id: "rs-shard-5",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_5:27017" },
            { _id: 1, host: "mongodb_replica_node_5_0:27017" },
            { _id: 2, host: "mongodb_replica_node_5_1:27017" }
        ]
    }
)
