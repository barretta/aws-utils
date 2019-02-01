# aws-utils

AWS Utils commands

- Move messages from Queue Dead Letter to Queue. (One by one...)

```sh
   for i in {1..200} /; do ./move-sqs-dlq-to-queue.sh; done
```

To run in parallel

```sh
printf %s\\n {0..99} | xargs -n 1 -P 8 ./move-sqs-dlq-to-queue.sh
```
