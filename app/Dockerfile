# Use official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Copy remaining source files
COPY . .

# Expose application port
EXPOSE 3000

# Run the server
CMD ["npm", "start"]
