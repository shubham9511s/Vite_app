# Use an official Node.js runtime as the base image
FROM node:alpine

# Set the working directory in the container
WORKDIR /app


COPY ./package.json /app

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . /app

# Expose the port on which the server will run by default port is 5173
#EXPOSE 5173

# Define the command to run the application
CMD ["npm","run", "dev"]


