#Pull base imdage
From tomcat:8-jre8

#Maintainer
MAINTAINER "ynraju4@gmail.com"

#copy war file on to container
COPY ./webapp.war /usr/local/tomcat/webapps

