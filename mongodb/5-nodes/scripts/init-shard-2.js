rs.initiate(
    {
        _id: "rs-shard-2",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_2:27017" },
        ]
    }
)
