FROM node:14.21.3-bullseye
WORKDIR /app
COPY . /app
RUN apt-get update && \
    apt-get install -y cmake libjpeg62-turbo-dev gcc g++ && \
    cd mjpg-streamer/mjpg-streamer-experimental/ && \
    make && \
    make install
RUN npm install
EXPOSE 8000
CMD ["npm", "run", "start"]
