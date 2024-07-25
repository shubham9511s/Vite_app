# Stage 1: Build
FROM node:22-alpine AS build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the application
RUN npm run build

# Stage 2: Run
FROM gcr.io/distroless/nodejs:16

# Set the working directory in the container
WORKDIR /app

# Copy the built assets and node_modules from the build stage
COPY --from=build /app/dist /app/dist
COPY --from=build /app/node_modules /app/node_modules
COPY --from=build /app/package.json /app/package.json

# Expose the port on which the server will run (default port is 5173)
EXPOSE 5173

# Define the command to run the application
CMD ["dist/index.js"]
