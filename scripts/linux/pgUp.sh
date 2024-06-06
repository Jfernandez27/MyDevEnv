cd $(dirname $0)
echo Uploading postgreSQL Container MyDevEnv..
cd ../../docker
docker-compose -f docker-compose.yml up -d postgresql