# Build Phase
FROM node:alpine AS build
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Deploy Phase
FROM nginx AS deploy
COPY --from=build /usr/app/build /usr/share/nginx/html