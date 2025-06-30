# Stage 1: Builder
FROM node:18 AS builder

WORKDIR /app
COPY package.json ./
RUN npm install --production
COPY . .

# Stage 2: Runtime with Distroless
FROM gcr.io/distroless/nodejs18

WORKDIR /app
COPY --from=builder /app .

CMD ["index.js"]
