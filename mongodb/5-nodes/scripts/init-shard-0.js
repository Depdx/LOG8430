rs.initiate(
    {
        _id: "rs-shard-0",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_0:27017" },
        ]
    }
)
