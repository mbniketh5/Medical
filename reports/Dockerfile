FROM nginx:latest

COPY index.html /usr/share/nginx/html/reports/index.html

COPY style.css /usr/share/nginx/html/reports/style.css

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
