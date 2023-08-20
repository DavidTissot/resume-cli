IMAGE_NAME=my-resume
TAG=latest

run: ## Run the docker image in local get your credentials in env variables
	@docker build -t dtissot/${IMAGE_NAME}:${TAG} .
	@docker run -p 5000:5000 --platform linux/x86_64 dtissot/${IMAGE_NAME}:${TAG} 

login: ## Login to Dockerhub
	@docker login --username ${DOCKER_USERNAME} --password ${DOCKER_TOKEN}

push: ## Push the image in Dockerhub
	@docker push dtissot/${IMAGE_NAME}:${TAG}

help: ## Print help
	@cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: .*## *" | awk 'BEGIN {FS = ": .*## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

