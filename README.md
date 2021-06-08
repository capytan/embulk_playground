This is the repository we created for embulk learning. You can use the following command to migrate data from mysql to postgresql.

## commands

```
* Replace localhost in seed.yml with the private ip address of your machine.

# build embulk image
docker build -t embulk .
# run mysql, postgres and adminer
docker-compose up -d
# Generate a config file from seed.yml
docker run --rm -it -v $(pwd)/embulk:/embulk embulk guess seed.yml -o config.yml
# dry run
docker run --rm -it -v $(pwd)/embulk:/embulk embulk preview config.yml
# run
docker run --rm -it -v $(pwd)/embulk:/embulk embulk run config.yml
```