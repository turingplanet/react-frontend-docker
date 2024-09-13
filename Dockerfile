# Use an official Node.js runtime as a parent image
FROM --platform=linux/amd64 node:18
# FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and pnpm-lock.yaml (or pnpm-lock.yml) to the container
COPY package.json pnpm-lock.yaml ./

# Install pnpm
RUN npm install -g pnpm

# Install dependencies using pnpm
RUN pnpm install

# Copy the rest of your application code
COPY . .

# Expose port 3000 assuming that's what your app runs on
EXPOSE 3000

# Run the app using pnpm
CMD ["pnpm", "start"]
