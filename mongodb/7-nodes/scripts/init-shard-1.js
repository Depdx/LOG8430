rs.initiate(
    {
        _id: "rs-shard-1",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_1:27017" },
        ]
    }
)
