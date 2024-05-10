# Use an official Node.js runtime as the base image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy the rest of the application code to the working directory
COPY . /app

# Install dependencies
RUN npm install

# Expose the port on which the server will run by default port is 5173
EXPOSE 5173

# Define the command to run the application
CMD ["npm","run", "dev"]


