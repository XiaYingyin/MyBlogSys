#!/bin/bash
TOMCAT_DIR=/home/tomcat/apache-tomcat-7.0.85
PROJECT_DIR=/root/pro/blog
WAR_FILE=ROOT
echo "##### 自动化部署开始。。。 #####"
cd $PROJECT_DIR
echo "##### 更新项目"
git pull origin master
echo "##### Build the war file... "
mvn clean
mvn package
echo "停止tomcat。。。。。"
sh $TOMCAT_DIR/bin/shutdown.sh
echo "删除war包"
sudo rm -f $TOMCAT_DIR/webapps/$WAR_FILE.war
echo "删除文件"
sudo rm -rf $TOMCAT_DIR/webapps/$WAR_FILE
echo "拷贝最新war到服务器上"
sudo cp $PROJECT_DIR/target/$WAR_FILE.war $TOMCAT_DIR/webapps/$WAR_FILE.war
echo "启动tomcat。。。"
sh $TOMCAT_DIR/bin/startup.sh
echo "自动化部署完成。。。"
echo "启动日志记录。。。。"
cd $TOMCAT_DIR/logs
tail -f catalina.out