#!/bin/bash
QUEUE_URL=https://sqs.sa-east-1.amazonaws.com...

MESSAGE_BODY=$1

echo $MESSAGE_BODY

aws sqs send-message --queue-url "$QUEUE_URL" --message-body "$MESSAGE_BODY" --region sa-east-1
