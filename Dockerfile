# Dockerfile for Elyan Labs Site
# Multi-stage build for production and development

# ---- Base Stage ----
FROM node:18-alpine AS base
WORKDIR /app
ENV NODE_ENV=production
RUN apk add --no-cache python3 make g++ git

# ---- Dependencies Stage ----
FROM base AS deps
# Copy package files
COPY package*.json ./
# Install dependencies
RUN npm ci --only=production --ignore-scripts
# Copy production node_modules aside for later use
RUN cp -R node_modules prod_node_modules
# Install ALL node_modules, including 'devDependencies'
RUN npm ci --ignore-scripts

# ---- Builder Stage ----
FROM base AS builder
# Copy node_modules from deps stage
COPY --from=deps /app/node_modules ./node_modules
# Copy source code
COPY . .
# Build the application (if needed)
# RUN npm run build

# ---- Production Stage ----
FROM base AS production
# Copy production node_modules
COPY --from=deps /app/prod_node_modules ./node_modules
# Copy built application from builder stage
COPY --from=builder /app ./
# Copy only necessary files
COPY index.html ./
COPY react-counter.html ./
COPY 404.html ./
COPY config.json ./
COPY README.md ./
COPY LICENSE ./
COPY CONTRIBUTING.md ./
COPY CODE_OF_CONDUCT.md ./
COPY .dockerignore ./
# Expose port
EXPOSE 3000
# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/ || exit 1
# Set non-root user
USER node
# Start command
CMD ["npx", "serve", "-s", ".", "-l", "3000"]

# ---- Development Stage ----
FROM base AS development
ENV NODE_ENV=development
# Copy package files
COPY package*.json ./
# Install all dependencies including devDependencies
RUN npm ci --ignore-scripts
# Copy source code
COPY . .
# Expose port
EXPOSE 3000
EXPOSE 9229  # Node.js debug port
# Development command with live reload
CMD ["npx", "serve", "-s", ".", "-l", "3000"]

# ---- Test Stage ----
FROM development AS test
ENV NODE_ENV=test
# Run tests
# RUN npm test

# ---- Lint Stage ----
FROM development AS lint
# Run linting
# RUN npm run lint

# ---- Security Scan Stage ----
FROM aquasec/trivy:latest AS security-scan
COPY --from=production /app /app
# Scan for vulnerabilities
# RUN trivy filesystem --severity HIGH,CRITICAL /app

# Labels
LABEL org.opencontainers.image.title="Elyan Labs Site"
LABEL org.opencontainers.image.description="Web platform for Elyan Labs projects and experiments"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.authors="Elyan Labs Team <team@elyanlabs.com>"
LABEL org.opencontainers.image.url="https://elyanlabs.com"
LABEL org.opencontainers.image.source="https://github.com/Scottcjn/elyan-labs-site"
LABEL org.opencontainers.image.licenses="MIT"
LABEL maintainer="Elyan Labs Team <team@elyanlabs.com>"

# Bounty task information
# This Dockerfile was created as part of a bounty task
# Bounty Task: [EASY BOUNTY: 1 RTC] Add a Dockerfile to any repo missing one (Issue #1629)
# Payment Address for Bounty: ERC20: 0xB3ff5422f49324FD99a0AB7905440C9586d99999 or TRC20: TGPZ5ozM1LLxXyErA45hKfcuR2cF7ntcsk