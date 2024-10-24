FROM python:3.13-alpine
WORKDIR /app
COPY requirements.txt .
RUN pip install --upgrade pip
RUN set -e; \
	apk add \
		gcc \
		libc-dev \
		linux-headers \
		gcompat \
		binutils \
        ; \
        pip install -r requirements.txt;
COPY . .
RUN chmod +x resume-cli
ARG USER=cv
ENV HOME /home/$USER
RUN adduser -D $USER
USER $USER
EXPOSE 5000
CMD ["uwsgi", "--ini", "app.ini"]
