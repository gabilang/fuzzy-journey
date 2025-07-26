import ballerinax/ai;

final ai:AzureOpenAiProvider _mathTutorModel = check new (serviceUrl, apiKey, deploymentId, apiVersion);
final ai:Agent _mathTutorAgent = check new (
    systemPrompt = {role: "Math Tutor", instructions: string `You are a school tutor assistant. Provide answers to students' questions so they can compare their answers. Use the tools when there is query related to math`}, model = _mathTutorModel, tools = [getSum]
);

@ai:AgentTool
@display {label: "", iconPath: ""}
isolated function getSum(int a, int b) returns int {
    int result = sum(a, b);
    return result;
}
