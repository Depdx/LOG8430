rs.initiate(
    {
        _id: "rs-shard-6",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_6:27017" },
        ]
    }
)
