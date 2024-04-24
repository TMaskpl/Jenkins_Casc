FROM jenkins/jenkins

LABEL maintainer = "TMaskPL - biuro@tmask.pl" 


ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

WORKDIR /tmask.pl 
COPY requirements.txt /tmask.pl 
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN java -jar /opt/jenkins-plugin-manager.jar --plugin-file /usr/share/jenkins/ref/plugins.txt
COPY casc.yaml /var/jenkins_home/casc.yaml

USER root
 
RUN apt-get update && apt-get install -y python3-dev python3-pip
 
USER jenkins

RUN pip3 install --no-cache-dir -r requirements.txt --break-system-packages
