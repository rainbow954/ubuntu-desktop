VERSION=latest
PROJECT_ID= iotbull
PROJECT= registry.cn-hangzhou.aliyuncs.com/${PROJECT_ID}

all: build
login:
	docker login registry.cn-shanghai.aliyuncs.com -u rainbow954@163.com -p dockerhub@iotbull.com
build: login
	docker build  -t ${PROJECT}/ubuntu-desktop:${VERSION} .

push: build    
	docker push ${PROJECT}/ubuntu-desktop:${VERSION}

.PHONY: all build push
