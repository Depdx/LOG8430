rs.initiate(
    {
        _id: "rs-shard-5",
        version: 1,
        members: [
            { _id: 0, host: "mongodb_node_5:27017" },
        ]
    }
)
