rs.initiate(
    {
        _id: "rs-shard-3",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_3:27017" },
        ]
    }
)
