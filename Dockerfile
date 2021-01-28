# build phase
FROM node:alpine
WORKDIR /home/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase
FROM nginx
COPY --from=0 /home/app/build /usr/share/nginx/html
