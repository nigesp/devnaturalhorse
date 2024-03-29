dataSource {
    pooled = true
    /*driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""*/
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQLDialect"
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}

// environment specific settings
environments {
    development {
        /*dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE"
        }*/
        dataSource {
            //logSql = true
            username = "root"
            password = "ZAQxsw"
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost/thenaturalhorse?autoreconnect=true"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE"
        }
    }
    production {

        def envVar = System.getenv("VCAP_SERVICES")
        def credentials = envVar?grails.converters.JSON.parse(envVar)["mysql-5.1"][0]["credentials"]:null

        dataSource {
            pooled = true
            dbCreate = "update"
            driverClassName = "com.mysql.jdbc.Driver"
            url =  credentials?"jdbc:mysql://${credentials.hostname}:${credentials.port}/${credentials.name}?useUnicode=yes&characterEncoding=UTF-8":""
            username = credentials?credentials.username:""
            password = credentials?credentials.password:""
        }
    }
}
