#!/bin/bash
# Dockerfile_build.sh
java -Dmaven.multiModuleProjectDirectory=/home/ljp/git/work-user-centre/work-user-centre-backend -Djansi.passthrough=true -Dmaven.home=/snap/intellij-idea-ultimate/583/plugins/maven/lib/maven3 -Dclassworlds.conf=/snap/intellij-idea-ultimate/583/plugins/maven/lib/maven3/bin/m2.conf -Dmaven.ext.class.path=/snap/intellij-idea-ultimate/583/plugins/maven/lib/maven-event-listener.jar -javaagent:/snap/intellij-idea-ultimate/583/lib/idea_rt.jar=37007 -Dfile.encoding=UTF-8 -Dsun.stdout.encoding=UTF-8 -Dsun.stderr.encoding=UTF-8 -classpath /snap/intellij-idea-ultimate/583/plugins/maven/lib/maven3/boot/plexus-classworlds-2.8.0.jar:/snap/intellij-idea-ultimate/583/plugins/maven/lib/maven3/boot/plexus-classworlds.license org.codehaus.classworlds.Launcher -Didea.version=2024.3.4.1 package
docker build -t work-user-centre-backend:0.0.1 .
