FROM nginx:alpine

# Quitar el contenido por defecto de nginx
RUN rm -rf /usr/share/nginx/html/*

# Copiar el sitio estatico (los .zip y backups quedan fuera via .dockerignore)
COPY . /usr/share/nginx/html/

EXPOSE 80

# nginx:alpine ya arranca nginx en primer plano por defecto
