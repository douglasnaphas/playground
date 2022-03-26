const ApiGatewayManagementApi = require("aws-sdk/clients/apigatewaymanagementapi");
const api = new ApiGatewayManagementApi({
  endpoint:
    process.env.WS_ENDPOINT ||
    "280igs74mf.execute-api.us-east-1.amazonaws.com/ws",
});
const dateString = new Date().toISOString();
const message = process.env.POST_TO_CONNECTION_DATA || `hi at ${dateString}`;
const Data = Buffer.from(message);
const postToConnectionParams = {
  ConnectionId: process.env.CONNECTION_ID || "PnZGddvPoAMCKNg=",
  Data,
};
(async () => {
  try {
    const data = await api.postToConnection(postToConnectionParams).promise();
    console.log(JSON.stringify(data, 2));
  } catch (e) {
    console.log(e);
    process.exit(2);
  }
})();
