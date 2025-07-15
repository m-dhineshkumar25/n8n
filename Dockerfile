FROM node:18-alpine

WORKDIR /app

COPY . .

# Enable Corepack and install correct Yarn version (as defined in package.json)
RUN corepack enable && corepack prepare yarn@stable --activate

# Install dependencies using Yarn Berry
RUN yarn install

EXPOSE 5678

CMD ["yarn", "start"]
