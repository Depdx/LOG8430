rs.initiate(
    {
        _id: "rs-config-server",
        configsvr: true,
        version: 1,
        members:[
            { _id: 0,
              host : 'configserver:27017'
            },
        ]
    }
)
