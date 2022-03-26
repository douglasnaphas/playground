const DynamoDB = require("aws-sdk/clients/dynamodb");
const db = new DynamoDB.DocumentClient();
const queryForConnectionIdsParams = {
  TableName:
    "DouglasnaphasMadliberation250-ws-roster-webapp-SedersTable7FFD9727-WW3J54QQ8OWQ",
  KeyConditionExpression: `room_code = :rc and begins_with(lib_id, :prefix)`,
  ExpressionAttributeValues: {
    ":rc": "XRXCXA",
    ":prefix": "connect#",
  },
};
(async () => {
  try {
    const data = await db.query(queryForConnectionIdsParams).promise();
    console.log(JSON.stringify(data, 2));
  } catch (e) {
    console.log(e);
    process.exit(2);
  }
})();

/*
{
  "Items": [
    {
      "lib_id": "connect#PktBLdr_IAMCJxA=",
      "room_code": "XRXCXA",
      "date": "2022-03-26T03:56:04.897Z",
      "connection_id": "PktBLdr_IAMCJxA=",
      "ms": 1648266964897
    }
  ],
  "Count": 1,
  "ScannedCount": 1
}
*/
