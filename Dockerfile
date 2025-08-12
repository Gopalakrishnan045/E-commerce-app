# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all source code
COPY . .

# Expose the port your app runs on (change 5000 if needed)
EXPOSE 5000

# Start the server (change if your entry file is different)
CMD ["npm", "start"]

