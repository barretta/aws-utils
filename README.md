# aws-utils

AWS Utils commands

- Move messages from Queue Dead Letter to Queue. (One by one...)

```sh
   for i in {1..200} /; do ./move-sqs-dlq-to-queue.sh; done
```
