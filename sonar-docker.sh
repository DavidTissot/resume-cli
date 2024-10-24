#!/bin/bash
docker run \
    --rm \
    -e SONAR_HOST_URL="$SONAR_URL" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=my-resume" \
    -e SONAR_LOGIN="$SONAR_LOGIN" \
    -v "./:/usr/src" \
    sonarsource/sonar-scanner-cli
