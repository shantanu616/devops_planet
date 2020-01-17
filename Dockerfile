FROM node:alpine as builder
WORKDIR /var/planetshare
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
FROM nginx
COPY --from=builder /var/planetshare/build /usr/share/nginx/html
