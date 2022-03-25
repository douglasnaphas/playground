const DynamoDB = require("aws-sdk/clients/dynamodb");
const db = new DynamoDB.DocumentClient();
const getParticipantParams = {
  TableName:
    "DouglasnaphasMadliberation250-ws-roster-webapp-SedersTable7FFD9727-WW3J54QQ8OWQ",
  Key: {
    room_code: "ZSMORM",
    lib_id:
      `participant` +
      `#` +
      `a2fbc754b9ee1dc5a793eeb2c804c5e6cf962f680909050f28a69b6cdfdbab89`,
  },
};
(async () => {
  try {
    const data = await db.get(getParticipantParams).promise();
    console.log(data);
  } catch (e) {
    console.log(e);
    process.exit(2);
  }
})();

/*
{
  Item: {
    lib_id: 'participant#a2fbc754b9ee1dc5a793eeb2c804c5e6cf962f680909050f28a69b6cdfdbab89',
    room_code: 'ZSMORM',
    session_key: 'VMSSHYCHBHJRUGHOMAIHNKTRECLNAL',
    game_name: 'Le'
  }
}
*/
