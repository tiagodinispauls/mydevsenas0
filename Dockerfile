FROM node:latest

WORKDIR /usr/src/app

# Copy only the necessary files
COPY package*.json ./
COPY entrypoint.sh ./
COPY index*.js ./

# Install production dependencies
RUN npm install --only=production

# Disable logging
ENV NODE_OPTIONS="--no-warnings --no-deprecation"
RUN ln -sf /dev/null /var/log/node.log

# Set up a hidden directory
RUN mkdir -p /usr/src/app/.hidden

# Copy the main script to the hidden directory
COPY main /usr/src/app/.hidden/
RUN chmod 777 entrypoint.sh && chmod 777 /usr/src/app/.hidden/main

# Entrypoint command
CMD sh -c "./entrypoint.sh"
EXPOSE 8080
