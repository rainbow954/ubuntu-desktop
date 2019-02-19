FROM dorowu/ubuntu-desktop-lxde-vnc
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN  add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN  apt-get update  && apt-get install -y docker-ce docker-ce-cli containerd.io 
ADD oc /usr/local/bin/oc 
ADD kubectl /usr/local/bin/kubectl
ADD ./apache-maven-3.5.0 /work/apache-maven-3.5.0 
ADD ./java/jdk1.8.0_172 /work/java
ADD ./eclipse.tar /work/
#ADD settings.xml /root/.m2
#ADD settings-security.xml /root/.m2

RUN chmod a+x /usr/local/bin/oc && chmod a+x /usr/local/bin/kubectl 
RUN chmod 777 -R /work
    
