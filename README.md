# Rackline — Sitio estático (Docker)

Sitio web estático servido con **nginx:alpine**. No requiere PHP, base de datos ni cPanel.

- Página principal: `index.html`
- Variante para impresión/PDF: `index-print.html`
- Página de gracias: `gracias.html`
- Recursos: `assets/` y `uploads/`

## Levantar con docker compose (recomendado)

```bash
docker compose up -d --build
```

El sitio queda disponible en: **http://localhost** (puerto 80)

Detener:

```bash
docker compose down
```

## Alternativa: solo Docker (sin compose)

```bash
# Construir la imagen
docker build -t rackline-web:latest .

# Ejecutar el contenedor
docker run -d --name rackline-web -p 80:80 --restart unless-stopped rackline-web:latest
```

Sitio disponible en: **http://localhost** (puerto 80)

Detener y eliminar:

```bash
docker stop rackline-web && docker rm rackline-web
```

## Notas para el servidor

- El contenedor expone y publica el puerto **80** (`80:80`), listo para servir directo en el
  puerto estándar HTTP del servidor. Si el 80 ya está ocupado, cambiá el mapeo (ej. `"8080:80"`)
  en `docker-compose.yml` o usá `-p 8080:80` en `docker run`.
- Los archivos `*.zip` (backups de "Rackline" y "lewis") y `assets.zip` **no se incluyen** en la
  imagen gracias a `.dockerignore`.
