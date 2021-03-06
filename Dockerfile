# Build Phase
FROM node:alpine AS build
WORKDIR /usr/app
COPY package.json .
RUN npm install --loglevel=error
COPY . .
RUN npm run build

# Deploy Phase
FROM nginx AS deploy
EXPOSE 80
COPY --from=build /usr/app/build /usr/share/nginx/html