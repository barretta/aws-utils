#!/bin/bash
QUEUE_URL=https://sqs.sa-east-1.amazonaws.com...
QUEUE_DLQ_URL=https://sqs.sa-east-1.amazonaws.com...

QUEUE_MESSAGE=$(aws sqs receive-message --queue-url $QUEUE_DLQ_URL --max-number-of-messages 1 --visibility-timeout 43200 --region sa-east-1)

MESSAGE_BODY=$(echo $QUEUE_MESSAGE | jq -r '.Messages[0].Body')
MESSAGE_ID=$(echo $QUEUE_MESSAGE | jq -r '.Messages[0].ReceiptHandle')

echo $MESSAGE_BODY
echo $MESSAGE_ID

aws sqs send-message --queue-url "$QUEUE_URL" --message-body $MESSAGE_BODY --region sa-east-1

aws sqs delete-message --queue-url $QUEUE_DLQ_URL --receipt-handle $MESSAGE_ID --region sa-east-1
