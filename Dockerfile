FROM node:18-alpine

WORKDIR /app

COPY package*.json . 

COPY .env .
RUN npx prisma init
COPY . .


RUN npm install
RUN npx prisma migrate deploy

COPY . .


EXPOSE 3000

CMD [ "npm", "run", "dev" ]
