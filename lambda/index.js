const AWS = require("aws-sdk");
const ses = new AWS.SES();

exports.handler = async (event) => {
  console.log("Incoming event:", JSON.stringify(event, null, 2));
  console.log("EMAIL_TO env var:", process.env.EMAIL_TO);

  const body = JSON.parse(event.body);
  const { name, email, message } = body;

  const params = {
    Destination: {
      ToAddresses: [process.env.EMAIL_TO],
    },
    Message: {
      Body: {
        Text: {
          Data: `From: ${name} <${email}>\n\n${message}`,
        },
      },
      Subject: {
        Data: "New Contact Form Submission",
      },
    },
    Source: process.env.EMAIL_TO,
  };

  try {
    await ses.sendEmail(params).promise();
    return {
        statusCode: 200,
        headers: { "Access-Control-Allow-Origin": "*" },
        body: JSON.stringify({ success: true }),
      };
  } catch (err) {
    console.error("SES error:", err);
    return {
        statusCode: 500,
        headers: { "Access-Control-Allow-Origin": "*" },
        body: JSON.stringify({ error: err.message }),
      };
  }
};
