FROM node:latest AS builder
RUN mkdir -p /app
WORKDIR /app
COPY . /app/
RUN npm install



# nginx img

FROM nginx:alpine
COPY --from=builder /app/dist/myapp /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
