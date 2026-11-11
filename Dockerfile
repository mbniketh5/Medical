FROM nginx:latest

COPY index.html /usr/share/nginx/index.html

COPY style.css /usr/share/nginx/style.css

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

