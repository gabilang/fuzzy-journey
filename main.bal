import ballerina/http;
import ballerinax/ai;

listener ai:Listener mathTutorListener = new (listenOn = check http:getDefaultListener());

service /mathTutor on mathTutorListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {

        string stringResult = check _mathTutorAgent->run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
