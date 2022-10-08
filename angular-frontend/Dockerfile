# Stage 1

FROM node:12.22.11-alpine as node
WORKDIR /app
COPY . .
RUN npm install
COPY . /app
RUN npm run build --prod

# Stage 2

FROM nginx:1.23.1-alpine
COPY --from=node /app/dist/angular-frontend /usr/share/nginx/html 