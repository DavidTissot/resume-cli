IMAGE_NAME=my-resume
TAG=latest
DATE=`date +'%d-%m-%Y-%H-%M-%S'`

run: ## Run the docker image in local get your credentials in env variables
	@docker build -t dtissot/${IMAGE_NAME}:${TAG} .
	@docker run -p 5000:5000 --platform linux/x86_64 dtissot/${IMAGE_NAME}:${TAG}

login: ## Login to Dockerhub
	@docker login --username ${DOCKER_USERNAME} --password ${DOCKER_TOKEN}

push: ## Push the image in Dockerhub
	@docker push dtissot/${IMAGE_NAME}:${TAG}

sonar: ## Run sonarqube on repo
	@docker run --rm -e SONAR_HOST_URL=$SONAR_URL -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=my-resume" -e SONAR_LOGIN=$SONAR_LOGIN -v "./:/usr/src" sonarsource/sonar-scanner-cli

requirements: ## Make the requirements file
	@poetry export --without-hashes --format=requirements.txt > requirements.txt

checks: ## Checks all the pre-commit actions
	@pre-commit run --all-files

trivy: ## Checks vulnerabilities
	trivy fs --scanners vuln,secret,misconfig .

help: ## Print help
	@cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: .*## *" | awk 'BEGIN {FS = ": .*## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
