FROM node:alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx
#for aws replace builder with 0
COPY --from=0 /app/build /usr/share/nginx/html