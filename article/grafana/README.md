
#exporter \

Mysql： https://github.com/bazingafraser/cv/blob/master/article/grafana/mysqld_exporter-0.11.0.linux-amd64.tar.gz \
启动方式：nohup ./mysqld_exporter --config.my-cnf=.my.cnf & \
Linux： https://github.com/bazingafraser/cv/blob/master/article/grafana/node_exporter-0.14.0.linux-amd64.tar.gz \
启动方式：nohup ./node_exporter & \
Redis： https://github.com/bazingafraser/cv/blob/master/article/grafana/redis_exporter.tar.gz \
启动方式：nohup ./redis_exporter  -redis.addr 10.10.10.1:6379  -redis.password redis123 & \
Mongodb： https://github.com/bazingafraser/cv/blob/master/article/grafana/mongodb_exporter-linux-amd64.tar.gz \
启动方式： nohup ./mongodb_exporter-linux-amd64 & \
