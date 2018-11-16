#!/bin/bash
ENV=$1
if [ $ENV = "QA" ]; then
 for i in 'cat ip.txt'
  do
    echo "deploy war file $i:"
    sshpass -p "1234" scp target/ford.war mahesh1@$i:/home/mahesh1/soft/apache-tomcat-8.5.32/webapps
    echo "server starting $i"
    sshpass -p "1234" ssh mahesh1@$i "JAVA_HOME=/home/mahesh1/soft/jdk1.8.0_181" "/home/mahesh1/soft/apache-tomcat-8.5.32/bin/startup.sh"
  done
 echo "display deploy success"
 fi
