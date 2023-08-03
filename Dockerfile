#stage 1
FROM node:14.16.1-alpine as builder
WORKDIR /app
COPY . .
RUN npm cache clean --force
RUN npm install
RUN npm i -g @angular/cli@8.0.0
RUN npm run build --prod

FROM nginx:1.15.8-alpine
EXPOSE 80
COPY --from=builder /app/dist/angular-app /usr/share/nginx/html
