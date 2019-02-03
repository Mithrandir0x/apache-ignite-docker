#!/bin/bash

ZK_VERSION=$1

sed -i -r 's|#(log4j.appender.ROLLINGFILE.MaxBackupIndex.*)|\1|g' $ZK_HOME/conf/log4j.properties
sed -i -r 's|#autopurge|autopurge|g' $ZK_HOME/conf/zoo.cfg
sed -i "/clientPort/d" $ZK_HOME/conf/zoo.cfg

echo "clientPort=$ZOOKEEPER_PORT" >> $ZK_HOME/conf/zoo.cfg

/opt/zookeeper-$ZK_VERSION/bin/zkServer.sh start-foreground
