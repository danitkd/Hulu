# Hulu DaniTkd
This is an application for Roku platform using brightscript and scenegraph. 

# Main feature
+ Simulation of login screen.
+ Home view using rowlist.
+ Video playback.
+ Custom widgets for buttons 

# Requirements
The api for this project is a local server which is included in the deliverables as `resty2-1.0.0-SNAPSHOT.jar`. 
This local server requires java 11 https://www.oracle.com/co/java/technologies/javase/jdk11-archive-downloads.html.

# Installation
To spin up the server download the jar file and run `java -jar resty2-1.0.0-SNAPSHOT.jar`, it will be running on 8080 port.
After this, api should be available at http://<your_ip>:8080

Once the server is running upload the `roku-deploy.zip` file into the target device.

