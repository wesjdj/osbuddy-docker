#!/bin/bash
wget https://download.java.net/java/GA/jdk14.0.2/205943a0976c4ed48cb16f1043c5c647/12/GPL/openjdk-14.0.2_linux-x64_bin.tar.gz

mkdir /usr/local/java

mv openjdk-14.0.2_linux-x64_bin.tar.gz /usr/local/java

cd /usr/local/java

tar zxvf openjdk-14.0.2_linux-x64_bin.tar.gz

update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk-14.0.2/bin/java" 1

wget -O /usr/local/bin/RuneLite.jar https://github.com/runelite/launcher/releases/download/2.1.3/RuneLite.jar

chmod 755 /usr/local/bin/RuneLite.jar

echo "#!/bin/bash
java -Xss2m -Xmx512m -XX:+UseG1GC -XX:CompileThreshold=1500 -Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true -Dnofork=true ${1/beta/-Dbranch=development} -jar /usr/local/bin/RuneLite.jar">/usr/local/bin/RuneLite.jar
#removes jar file and replaces it
cd /usr/local/bin
rm RuneLite.jar
wget https://github.com/runelite/launcher/releases/download/2.1.3/RuneLite.jar
#sets proper permissions
chmod 755 RuneLite.jar

java -jar /usr/local/bin/RuneLite.jar