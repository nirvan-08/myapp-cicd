# build stage
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build || echo "no build step"

# runtime stage
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app ./
RUN npm ci --production || echo "no dependencies to install"
ENV PORT=3000
EXPOSE 3000
CMD ["node", "server.js"]
