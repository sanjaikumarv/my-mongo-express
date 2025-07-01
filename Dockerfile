# Use Node.js 20 alpine image as builder
FROM node:20.15.0-alpine AS builder

# Set up working directory
RUN mkdir /app
WORKDIR /app

# Copy essential files
COPY package*.json ./
COPY . .

# Install dependencies and build
RUN npm install
ENV NODE_ENV=production


# Expose port for health check with fly.io
EXPOSE 8000/tcp

# Start the application
CMD ["node", "app.js"]
