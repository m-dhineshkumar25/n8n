FROM node:18-alpine

WORKDIR /app

COPY . .

# Enable corepack and activate the correct version of pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Install dependencies using pnpm
RUN pnpm install

EXPOSE 5678

CMD ["pnpm", "start"]
