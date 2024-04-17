rs.initiate(
    {
        _id: "rs-shard-6",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_6:27017" },
            { _id: 1, host: "mongodb_replica_node_6_0:27017" },
            { _id: 2, host: "mongodb_replica_node_6_1:27017" }
        ]
    }
)
