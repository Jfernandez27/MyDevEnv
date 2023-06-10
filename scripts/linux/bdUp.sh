cd $(dirname $0)
echo Uploading Database Containers MyDevEnv..
cd ../../docker
docker-compose -f docker-compose.yml up -d mysql mariadb