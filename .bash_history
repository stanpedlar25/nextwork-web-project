sudo dnf update -y
sudo dnf install -y java-1.8.0-amazon-corretto-devel
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64
export PATH=$JAVA_HOME/bin:$PATH
java -version
javac -version
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
wget https://archive.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
sudo tar -xzf apache-maven-3.5.2-bin.tar.gz -C /opt
echo "export PATH=/opt/apache-maven-3.5.2/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
ashrc
mvn -v
mvn archetype:generate   -DgroupId=com.nextwork.app   -DartifactId=nextwork-web-project   -Dpackage=com.nextwork.app   -DarchetypeArtifactId=maven-archetype-webapp   -DarchetypeVersion=1.4   -DinteractiveMode=false
mvn archetype:generate   -DgroupId=com.nextwork.app   -DartifactId=nextwork-web-project   -Dpackage=com.nextwork.app   -DarchetypeArtifactId=maven-archetype-webapp   -DarchetypeVersion=1.4   -DinteractiveMode=false
mvn -v
ps aux | grep vscode
exit
java -version
mvn -version
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
exit
pwd
git init
git --version
git init
git remote add origin git@github.com:stanpedlar25/nextwork-web-project.git
git add .
ls
git commit -m "Updated index.jsp with new content"
sudo yum update -y
sudo yum install git -y
git --version
git commit -m "Updated index.jsp with new content"
git push -u origin master
