# Project
The project consists of a Docker image which hosts a web application of my resume. The web application is built using HTML, CSS, JavaScript, flask and uwsgi and. It is deployed using Docker and can be accessed locally.

Here are some additional benefits of having a Docker image which hosts a web application of my resume:
- Portability: The Docker image can be easily deployed to any machine that has Docker installed. This makes it easy to share my resume with potential employers.
- Scalability: The Docker image can be scaled up or down to meet the needs of a website. This makes it a cost-effective way to host my resume.
- Security: The Docker image can be locked down to prevent unauthorized access to your resume. This helps to protect my personal information.

## Pre-requisite
- Having docker installed on your machine

## Installation
Prepare the docker image.
```
git clone https://github.com/DavidTissot/my-resume.git
cd my-resume
docker build -t dtissot/my-resume .
```
Or use the pre-built image in https://hub.docker.com/r/dtissot/my-resume
```
docker pull dtissot/my-resume
```
And run the built image.
```
docker run -d -p 5000:5000 --platform linux/x86_64 dtissot/my-resume
```
And visualize it on your browser.
```
http://localhost:5000
```
![alt text][cv]

## Other
You can run also in the cli my resume, by making a shell in the container :
```
docker ps
docker exec --it <container id> /bin/sh
```
And within the shell:
```
./resume-cli
```
![alt text][screen]

[cv]: cv-webapp.png "Screenshot of cv-webapp"
[screen]: resume-cli.gif "Screenshot of resume-cli"