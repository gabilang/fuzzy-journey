import ballerina/file;
import ballerina/log;

listener file:Listener directoryListener = new (path = "/tmp");

service file:Service on directoryListener {
    remote function onCreate(file:FileEvent event) {
        log:printInfo("File created " + event.name);
    }

    remote function onDelete(file:FileEvent event) {
        log:printInfo("File deleted " + event.name);
    }

    remote function onModify(file:FileEvent event) {
        log:printInfo("File modified " + event.name);
    }
}
