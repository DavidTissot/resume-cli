FROM python:3.11-alpine
WORKDIR /app
COPY requirements.txt .
RUN pip install --upgrade pip
RUN set -e; \
	apk add \
		gcc \
		libc-dev \
		linux-headers \
		gcompat \
		binutils=2.40-r7 \
        ; \
        pip install -r requirements.txt;
COPY . .
RUN chmod +x resume-cli
EXPOSE 5000
CMD ["uwsgi", "--ini", "app.ini"]
