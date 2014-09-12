# Docker image for Jenkins Enterprise by CloudBees master

FROM apemberton/jenkins-base
MAINTAINER Andy Pemberton <apemberton@cloudbees.com>

# Download jenkins.war

WORKDIR /usr/lib/jenkins
RUN curl -L -O -w "Downloaded: %{url_effective}\\n" "http://nectar-downloads.cloudbees.com/nectar/latest/jenkins.war"

ADD ./jenkins.sh /usr/local/bin/jenkins.sh
RUN chmod +x /usr/local/bin/jenkins.sh



USER jenkins

EXPOSE 8080 22 49187

ENV JENKINS_HOME /var/lib/jenkins

CMD ["/usr/local/bin/jenkins.sh"]

# CMD ["java", "-jar", "jenkins.war", "--httpPort=8080", "--prefix=/jenkins"]
