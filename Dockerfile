# Stage 1: Build the Node.js application
FROM node:20 AS build
WORKDIR /usr/src/app
COPY package*.json index.js ./
RUN npm install
COPY . .

# Stage 2: Setup NGINX and Node.js app
FROM nginx:alpine

# Install supervisor to manage both Node.js and Nginx
RUN apk update && apk add --no-cache supervisor nodejs npm

COPY --from=build /usr/src/app /usr/src/app
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf

# Expose port 80 for Nginx
EXPOSE 80

# Start supervisor which will start both Node.js and Nginx
CMD ["supervisord", "-c", "/etc/supervisord.conf"]