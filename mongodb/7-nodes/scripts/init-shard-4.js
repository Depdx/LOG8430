rs.initiate(
    {
        _id: "rs-shard-4",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_4:27017" },
        ]
    }
)
