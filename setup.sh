#!/bin/bash

# Arguments

#$1=dockerVersion
#$2=dockerComposeVersion
#$3=mysqlRootPassword
#$4=toolchainManagerDomain
#$5=toolchainWorkDomain
#$6=toolchainDeveloperDomain
#$7=dockerRegistry
#$8=mysqlDatabase
#$9=mysqlUser
#$10=baasChannelAdminEmail
#$11=baasChannelName
#$12=baasTokenCertPrivateKey
#$13=baasTokenCertContent
#$14=baasTokenAppId
#$15=mainThorNodeprovider
#$16=test1ThorNodeprovider
#$17=springRedisPassword 
#$18=toolchainGoodsServiceOssClient 
#$19=awsAccessKeyId
#$20=awsAccessKeySecret  
#$21=awsRegion
#$22=awsOssBucket 
#$23=awsOssUrl
#$24=aliOssUrl
#$25=aliOssAccess-key-id 
#$26=aliOssAccess-key-secret 
#$27=aliOssRegion
#$28=aliOssBucket
#$29=queryDataJsonCache
#$30=qqOssUrl
#$31=qqOssAccessKeyId 
#$32=qqOssAccessKeySecret 
#$33=qqOssRegion
#$34=qqOssBucket
#$35=awsKmsKeyPrefix
#$36=awsKmsKeyNum 
#$37=MySQL Script
#$38=Frontend Web Content
#$39=developerWorkAppUrl
#$40=localOrRemoteMySQL
#$41=mysqlHost
#$42=mysqlPort
#$43=createMySQLDB
#$44=localOrRemoteRedis
#$45=redisHost
#$46=redisPort
#$47=localURLprotocol
#$48=aliGreenRegion
#$49=aliGreen-key-id
#$50=aliGreen-key-secret
#${51}=toolchainDockerVersion


### Move mysql script and web front-end file to root user's home folder ###

mv ${37} ${38} /root/

# Copy private key and certificate to workspace folder
mv ${12} ${13} /root

### Move mysql script and web front-end file to root user's home folder end block ###

### Install docker and docker-compose ###

###	This file should be run in SUDO mode

#	Install tools
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

#	Setup stable repo
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

#	Enable edge & test repo
yum-config-manager --enable docker-ce-edge
yum-config-manager --enable docker-ce-test

#	Install latest version of Docker CE
yum install docker-ce-$1 docker-ce-cli-$1 containerd.io -y

#	Start Docker
systemctl start docker

sleep 3

yum install curl unzip -y

curl -L "https://github.com/docker/compose/releases/download/$2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

docker-compose --version

### Install docker and docker-compose end block ###

### Create folders used by docker containers ###

cd /root

mkdir -p nginx web logs data/redis-data data/mysql-data mysql-scripts

#My-sql script
cp ${37} mysql-scripts

#Web front-end toolchain manager content
cp ${38} web
cd web
unzip ${38}
cd /root
chown -R 33:33 web

### Create folders used by docker containers end block ###

### Create nginx configuration file ###

hostPrivateIP=`ip route get 1 | awk '{print $NF;exit}'`

cat > nginx/toolchain-nginx.conf <<EOF
server {
     listen       80;
     server_name  $4;

     client_max_body_size 100M;
     client_body_buffer_size 16k;

     access_log  /var/log/nginx/toolchaindemo.access.log  main;
     error_log  /var/log/nginx/toolchaindemo.error.log warn;

     location / {
            root /usr/share/nginx/html/;
            index index.html index.htm;
            if (!-e \$request_filename) {
                  rewrite ^/(.*) /index.html last;
                  break;
            }
     }

     location /manager/ {
         proxy_set_header X-Real-IP \$remote_addr;
         proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
         proxy_pass http://$hostPrivateIP:28913/manager/;
         proxy_redirect off;
     }

 }

 server {
     listen       80;
     server_name  $5;

     index index.html index.htm;

     access_log  /var/log/nginx/workapi.access.log  main;
     error_log  /var/log/nginx/workapi.error.log warn;


     location / {
         proxy_set_header X-Real-IP \$remote_addr;
         proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
         proxy_pass http://$hostPrivateIP:28913/work/;
         proxy_redirect off;
     }

 }

 server {
     listen       80;
     server_name  $6;

     index index.html index.htm;

     access_log  /var/log/nginx/developer.access.log  main;
     error_log  /var/log/nginx/developer.error.log warn;


     location /api/ {
         proxy_set_header X-Real-IP \$remote_addr;
         proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
         proxy_pass http://$hostPrivateIP:28913/api/;
         proxy_redirect off;
     }
 }
EOF
### Create nginx configuration file end block ###

### Setup mysql database ###

if [ "${40}" == "remote" ]
then
	dbHost=${41}
	dbPort=${42}
	dbUser=$9
else
	dbHost=`ip route get 1 | awk '{print $NF;exit}'`
	dbPort=3306
	dbUser=root

cat > my.cnf <<EOF
[mysqld]
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
datadir         = /var/lib/mysql
sql_mode        = STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION
secure-file-priv= NULL
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

# Custom config should go here
!includedir /etc/mysql/conf.d/
EOF

	docker run --name mysql -p 3306:3306 -v `pwd`/my.cnf:/etc/mysql/my.cnf -v $pwd/data/mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=$3 -e MYSQL_USER=root -d mysql
	sleep 60s
fi

if [ "${43}" == "yes" ]
then
	docker run -i --rm mysql mysql -h $dbHost -P $dbPort -u $dbUser -p$3 < ${37}
	sleep 60s
fi

### Setup mysql database end block ###


### config.properties ###
rm -f config.properties

if [ "$3" != "null" ]
then
	echo "spring.datasource.password=$3" >> config.properties
fi
if [ "$8" != "null" ]
then
	echo "spring.datasource.url=jdbc:mysql://$dbHost:$dbPort/$8?useSSL=true&verifyServerCertificate=false&useUnicode=true&characterEncoding=utf-8" >> config.properties
fi
if [ "$9" != "null" ]
then
	echo "spring.datasource.username=$9" >> config.properties
fi
if [ "${10}" != "null" ]
then
	echo "baas.channel.admin.email=${10}" >> config.properties
fi
if [ "${11}" != "null" ]
then
	echo "baas.channel.name=${11}" >> config.properties
fi
if [ "${12}" != "null" ]
then
    key=`cat ${12}`
	echo "baas.token.cert-private-key=$key" >> config.properties
fi
if [ "${13}" != "null" ]
then
    cert=`cat ${13}`
	echo "baas.token.cert-content=${cert}" >> config.properties
fi
if [ "${14}" != "null" ]
then
	echo "baas.token.appId = ${14}" >> config.properties
fi
if [ "${15}" != "null" ]
then
	echo "main.thor.nodeprovider=${15}" >> config.properties
fi
if [ "${16}" != "null" ]
then
	echo "test1.thor.nodeprovider=${16}" >> config.properties
fi
if [ "${44}" == "remote" ]
then
	redisHost=${45}
	redisPort=${46}
else
	redisHost=redis
	redisPort=6379
fi
if [ "$redisHost" != "null" ]
then
	echo "spring.redis.host = $redisHost" >> config.properties
fi
if [ "$redisPort" != "null" ]
then
	echo "spring.redis.port = $redisPort" >> config.properties
fi
if [ "${17}" != "null" ]
then
	echo "spring.redis.password=${17}" >> config.properties
fi
if [ "${18}" != "null" ]
then
	echo "toolchain.goods.service.oss.client = ${18}" >> config.properties
fi
if [ "${19}" != "null" ]
then
	echo "aws-access-key-id = ${19}" >> config.properties
fi
if [ "${20}" != "null" ]
then
	echo "aws-access-key-secret = ${20}" >> config.properties
fi
if [ "${21}" != "null" ]
then
	echo "aws-region = ${21}" >> config.properties
fi
if [ "${22}" != "null" ]
then
	echo "aws-oss-bucket = ${22}" >> config.properties
fi
if [ "${23}" != "null" ]
then
	echo "aws-oss-url = ${23}" >> config.properties
fi
if [ "${24}" != "null" ]
then
	echo "ali-oss-url= ${24}" >> config.properties
fi
if [ "${25}" != "null" ]
then
	echo "ali-oss-access-key-id = ${25}" >> config.properties
fi
if [ "${26}" != "null" ]
then
	echo "ali-oss-access-key-secret = ${26}" >> config.properties
fi
if [ "${27}" != "null" ]
then
	echo "ali-oss-region = ${27}" >> config.properties
fi
if [ "${28}" != "null" ]
then
	echo "ali-oss-bucket = ${28}" >> config.properties
fi
#if [ "{$29}" != "null" ]
#then
#	echo "query.data.json.cache = ${29}" >> config.properties
#fi
if [ "${30}" != "null" ]
then
	echo "qq-oss-url = ${30}" >> config.properties
fi
if [ "${31}" != "null" ]
then
	echo "qq-oss-access-key-id = ${31}" >> config.properties
fi
if [ "${32}" != "null" ]
then
	echo "qq-oss-access-key-secret = ${32}" >> config.properties
fi
if [ "${33}" != "null" ]
then
	echo "qq-oss-region = ${33}" >> config.properties
fi
if [ "${34}" != "null" ]
then
	echo "qq-oss-bucket = ${34}" >> config.properties
fi
if [ "${35}" != "null" ]
then
	echo "aws-kms-key-prefix = ${35}" >> config.properties
fi
if [ "${36}" != "null" ]
then
	echo "aws-kms-key-num = ${36}" >> config.properties
fi
if [ "${39}" != "null" ]
then
	echo "developerWorkAppUrl = ${39}" >> config.properties
else
	echo "developerWorkAppUrl =" >> config.properties
fi

if [ "${47}" != "null" ]
then
	echo "local-url=${47}://${4}/manager" >> config.properties
fi

if [ "${48}" != "null" ]
then
	echo "ali.green.region = ${48}" >> config.properties
fi

if [ "${49}" != "null" ]
then
	echo "ali.green.secret.id = ${49}" >> config.properties
fi

if [ "${50}" != "null" ]
then
	echo "ali.green.secret.key = ${50}" >> config.properties
fi


### config.properties end block ###

### Tool-chain configuration ###

if ! test -f config.properties ; then
    echo 'not exists config.properties'
fi

mkdir -p /data/config/
rm -rf /data/config/*
cp config.properties /data/config/external.properties

echo 'spring.datasource.names =main,test1' >> /data/config/external.properties
echo 'spring.datasource.names =main,test1' >> /data/config/work.properties
echo 'baas.gateway.url=https://baas.vetoolchain.com' >> /data/config/external.properties
grep 'developer.work.app.url' config.properties >> /data/config/external.properties
grep 'local-url' config.properties >> /data/config/external.properties
grep 'ali.green.region' config.properties >> /data/config/external.properties
grep 'ali.green.secret.id' config.properties >> /data/config/external.properties
grep 'ali.green.secret.key' config.properties >> /data/config/external.properties
#chains=$(grep 'spring.datasource.names' config.properties|cut -d'=' -f2)
chains="main,test1"
num=$(echo $chains |awk  -F',' '{print NF}'  )

sqlUrl=$(grep 'spring.datasource.url' config.properties|awk -F"url=" '{print $2}')
sqlUser=$(grep 'spring.datasource.username' config.properties|cut -d'=' -f2)
sqlPwd=$(grep 'spring.datasource.password' config.properties|cut -d'=' -f2)

 vidUrl=$(echo $sqlUrl|sed -e s/onekey-toolchain/onekey-toolchain-vid-\$\{CHAIN_TYPE\}/)
 echo "spring.datasource.url=$vidUrl" >> /data/config/vid.properties
 echo "spring.datasource.username=$sqlUser" >> /data/config/vid.properties
 echo "spring.datasource.password=$sqlPwd" >> /data/config/vid.properties
 echo 'baas.gateway.url=https://baas.vetoolchain.com' >> /data/config/vid.properties
 echo 'main.chain.name=main' >> /data/config/vid.properties
 echo 'baas.gateway.url=https://baas.vetoolchain.com' >> /data/config/work.properties
 echo 'main.chain.name=main' >> /data/config/work.properties
 grep 'baas.token.cert-private-key' config.properties >> /data/config/vid.properties
 grep 'baas.token.cert-content' config.properties >> /data/config/vid.properties
 grep 'baas.token.appId' config.properties >> /data/config/vid.properties
 grep 'spring.redis.host' config.properties >> /data/config/vid.properties
 grep 'spring.redis.port' config.properties >> /data/config/vid.properties
 grep 'spring.redis.password' config.properties >> /data/config/vid.properties
 echo 'one.key.startup=true' >> /data/config/external.properties

for i in $(seq 1 $num)
do
     chainType=$(echo $chains | cut -d ',' -f$i)
     echo "spring.datasource.$chainType.driver-class-name=com.mysql.jdbc.Driver">> /data/config/external.properties
     url=$(echo $sqlUrl|sed -e s/onekey-toolchain/onekey-toolchain-vid-$chainType/)
     echo "spring.datasource.$chainType.url=$url">> /data/config/external.properties
     echo "spring.datasource.$chainType.username=$sqlUser">> /data/config/external.properties
     echo "spring.datasource.$chainType.password=$sqlPwd">> /data/config/external.properties

     balanceurl=$(echo $sqlUrl|sed -e s/onekey-toolchain/onekey-balance-$chainType/)
     echo "spring.datasource.url=$balanceurl" >> /data/config/balance-$chainType.properties
     grep 'spring.datasource.username' config.properties >> /data/config/balance-$chainType.properties
     grep 'spring.datasource.password' config.properties >> /data/config/balance-$chainType.properties
     domain=$(grep "$chainType.thor.nodeprovider" config.properties |cut -d'=' -f2)
     echo "thor.nodeprovider=https://$domain" >> /data/config/balance-$chainType.properties
     echo "thor.nodewsprovider=wss://$domain" >> /data/config/balance-$chainType.properties


     if [ $i -eq 1 ]
	then
     	echo "spring.datasource.url=$url" >> /data/config/work.properties
        echo "spring.datasource.username=$sqlUser" >> /data/config/work.properties
        echo "spring.datasource.password=$sqlPwd" >> /data/config/work.properties
	else
        echo "spring.datasource.names =$chainType" >> /data/config/work.properties
	    echo "spring.datasource.$chainType.url=$url" >> /data/config/work.properties
        echo "spring.datasource.$chainType.username=$sqlUser" >> /data/config/work.properties
        echo "spring.datasource.$chainType.password=$sqlPwd" >> /data/config/work.properties
        echo "spring.datasource.$chainType.driver-class-name=com.mysql.jdbc.Driver">> /data/config/work.properties
        echo "spring.datasource.$chainType.type = com.alibaba.druid.pool.DruidDataSource">> /data/config/work.properties
     fi
done

     grep 'baas.gateway.url' config.properties >> /data/config/work.properties
     grep 'baas.token.cert-private-key' config.properties >> /data/config/work.properties
     grep 'baas.token.cert-content' config.properties >> /data/config/work.properties
     grep 'baas.token.appId' config.properties >> /data/config/work.properties
     grep 'spring.redis.host' config.properties >> /data/config/work.properties
     grep 'spring.redis.port' config.properties >> /data/config/work.properties
     grep 'spring.redis.password' config.properties >> /data/config/work.properties
 
### Tool-chain configuration end block ###

### Docker compose configuration ### 
cat > docker-compose.yml <<EOF
version: "3"
services:
  nginx:
    image: nginx
    restart: always
    volumes:
      - ./nginx/toolchain-nginx.conf:/etc/nginx/conf.d/toolchain-nginx.conf
      - ./web:/usr/share/nginx/html
      - ./logs/nginx:/var/log/nginx
    ports:
      - "80:80"
  redis:
    image: redis
    restart: always
    ports:
      - "6379:6379"
    volumes:
      - ./data/redis-data:/data
    command: redis-server --requirepass ${17}
  eureka:
    image: $7/onekey-toolchain-eureka:${51}
    container_name: toolchain-eureka
    ports:
      - 28910:28910
    environment:
      SERVER_PORT: 28910
    volumes:
      - /etc/hosts:/etc/hosts
      - /data/log:/logs
    depends_on:
      - nginx
      - redis      
  auth:
    image: $7/onekey-toolchain-auth-service:${51}
    container_name: toolchain-auth
    ports:
      - 28911:28911
    volumes:
      - /etc/hosts:/etc/hosts
      - /data/log:/logs
      - /data:/data
    environment:
      APOLLO_ENABLE: "false"
      SERVER_PORT: 28911
    depends_on:
      - eureka
      - nginx
      - redis      
    links:
      - eureka
  base:
    image: $7/onekey-toolchain-base-service:${51}
    container_name: toolchain-base
    ports:
      - 28912:28912
    volumes:
      - /etc/hosts:/etc/hosts
      - /data:/data
      - /data/log:/logs
    environment:
      APOLLO_ENABLE: "false"
      SERVER_PORT: 28912
    depends_on:
      - eureka
      - nginx
      - redis       
    links:
      - eureka
  gateway:
    image: $7/onekey-toolchain-gateway:${51}
    container_name: toolchain-gateway
    ports:
      - 28913:28913
    volumes:
      - /etc/hosts:/etc/hosts
      - /data/log:/logs
    environment:
      SERVER_PORT: 28913
    depends_on:
      - eureka
      - nginx
      - redis             
    links:
      - eureka
  manager:
    image: $7/onekey-toolchain-manager-service:${51}
    container_name: toolchain-manager
    ports:
      - 28914:28914
    volumes:
      - /etc/hosts:/etc/hosts
      - /data:/data
      - /data/log:/logs
    environment:
      APOLLO_ENABLE: "false"
      SERVER_PORT: 28914
    depends_on:
      - eureka
      - auth
      - base
      - nginx
      - redis
    links:
      - eureka
  vid-main:
    image: $7/onekey-toolchain-vid-service:${51}
    container_name: toolchain-vid-main
    ports:
      - 28915:28915
    volumes:
      - /etc/hosts:/etc/hosts
      - /data:/data
      - /data/log:/logs
    environment:
      APOLLO_ENABLE: "false"
      SERVER_PORT: 28915
      CHAIN_TYPE: "main"
    depends_on:
      - eureka
      - base
      - nginx
      - redis       
    links:
      - eureka
  vid-test1:
    image: $7/onekey-toolchain-vid-service:${51}
    container_name: toolchain-vid-test1
    ports:
      - 28916:28916
    volumes:
      - /etc/hosts:/etc/hosts
      - /data:/data
      - /data/log:/logs
    environment:
      APOLLO_ENABLE: "false"
      SERVER_PORT: 28916
      CHAIN_TYPE: "test1"
    depends_on:
      - eureka
      - base
      - nginx
      - redis       
    links:
      - eureka
  work:
    image: $7/onekey-toolchain-workapi-service:${51}
    container_name: toolchain-work
    ports:
      - 28917:28917
    volumes:
      - /etc/hosts:/etc/hosts
      - /data:/data
      - /data/log:/logs
    environment:
      APOLLO_ENABLE: "false"
      SERVER_PORT: 28917
    depends_on:
      - eureka
      - base
      - nginx
      - redis       
    links:
      - eureka
  order:
    image: $7/onekey-toolchain-order-service:${51}
    container_name: toolchain-order
    ports:
      - 28918:28918
    volumes:
      - /etc/hosts:/etc/hosts
      - /data:/data
      - /data/log:/logs
    environment:
      APOLLO_ENABLE: "false"
      SERVER_PORT: 28918
    depends_on:
      - eureka
      - base
      - nginx
      - redis       
    links:
      - eureka
  developer:
    image: $7/onekey-toolchain-developer-service:${51}
    container_name: toolchain-deveoper
    ports:
      - 28919:28919
    volumes:
      - /etc/hosts:/etc/hosts
      - /data:/data
      - /data/log:/logs
    environment:
      APOLLO_ENABLE: "false"
      SERVER_PORT: 28919
    depends_on:
      - eureka
      - base
      - nginx
      - redis       
    links:
      - eureka
  balance-main:
    image: $7/onekey-toolchain_balance-main:${51}
    container_name: toolchain-balance-main
    ports:
      - 28920:28920
    volumes:
      - /etc/hosts:/etc/hosts
      - /data:/data
      - /data/log:/logs
    environment:
      APOLLO_ENABLE: "false"
      SERVER_PORT: 28920
      APP_NAME: "toolchain-balance-main"
    depends_on:
      - eureka
      - gateway
      - nginx
      - redis                          
    links:
      - eureka
      - gateway
  balance-test1:
    image: $7/onekey-toolchain_balance-test1:${51}
    container_name: toolchain-balance-test1
    ports:
      - 28921:28921
    volumes:
      - /etc/hosts:/etc/hosts
      - /data:/data
      - /data/log:/logs
    environment:
      APOLLO_ENABLE: "false"
      SERVER_PORT: 28921
      APP_NAME: "toolchain-balance-test1"
    depends_on:
      - eureka
      - gateway
      - nginx
      - redis                    
    links:
      - eureka
      - gateway
EOF

#        exec /opt/files/startup.sh
### Docker compose configuration end block###

docker-compose pull
COMPOSE_HTTP_TIMEOUT=300 docker-compose up -d
