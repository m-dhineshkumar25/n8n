FROM node:18-alpine

WORKDIR /app

COPY . .

# Install Yarn
RUN npm install -g yarn

# Use Yarn to install workspace packages
RUN yarn install

EXPOSE 5678

CMD ["yarn", "start"]
