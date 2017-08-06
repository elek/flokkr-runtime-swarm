
# Kerberized autoscalable Hadoop cluster

## Start the cluster

```
docker stack deploy --compose-file docker-compose.yaml hadoop
```

## Smoketest

From the client machine (you need the krb5.conf):

```
docker-compose exec datanode bash
apk add --update krb5
kinit -kt /opt/hadoop/etc/hadoop/dn.keytab dn/`hostname`
klist
hdfs dfs -ls /
curl -v --negotiate -u : "http://sc:50070/webhdfs/v1/?op=LISTSTATUS&user.name=root"
klist
```
