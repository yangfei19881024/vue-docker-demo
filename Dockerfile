FROM node:8.12.0
RUN apt-get update
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN  npm install \
     && npm run build \
     && cp -r dist/* /var/www/html \
     && rm -rf /app
CMD ["nginx","-g","daemon off;"]
