# Load alpine base image
FROM alpine:3

# Add nginx and bash
RUN apk add --no-cache \
	nginx \
	bash

# Create app directory
WORKDIR /src

# Bundle app source
COPY . .

# Run app
ENTRYPOINT ["./start.sh"]
