FROM nginx:latest

COPY index.html /usr/share/nginx/html/dashboard/index.html

COPY style.css /usr/share/nginx/html/dashboard/style.css

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
