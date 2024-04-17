rs.initiate(
    {
        _id: "rs-shard-2",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_2:27017" },
            { _id: 1, host: "mongodb_replica_node_2_0:27017" },
            { _id: 2, host: "mongodb_replica_node_2_1:27017" }
        ]
    }
)
