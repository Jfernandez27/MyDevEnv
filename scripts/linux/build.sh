cd $(dirname $0)
echo Composing MyDevEnv containers...
cd ../docker
sudo docker-compose -f docker-compose.yml build