cd $(dirname $0)
echo Uploading mongoDB Container MyDevEnv..
cd ../../docker
docker-compose -f docker-compose.yml up -d mongodb