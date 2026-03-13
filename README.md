# PrimeVideo

> A Django-based streaming catalogue application with full PostgreSQL integration and Docker-based local development setup.

---

## Overview

PrimeVideo is a web application that replicates core catalogue and user management features of a streaming platform. Built with Django and backed by PostgreSQL, it demonstrates full-stack development practices including containerised database setup, ORM-based data modelling, and Django admin management.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Backend | Django 4.x |
| Database | PostgreSQL 17 (via Docker) |
| Containerisation | Docker |
| Auth | Django built-in auth |
| Admin | Django Admin |

---

## Installation

### 1. Clone the repository
```bash
git clone https://github.com/RelatifVision/PrimeVideo_PostgreSQL
cd PrimeVideo_PostgreSQL
```

### 2. Create and activate virtual environment
```bash
python -m venv venv
source venv/bin/activate       # macOS/Linux
venv\Scripts\activate          # Windows CMD
```

### 3. Install dependencies
```bash
pip install -r requirements.txt
```

### 4. Configure environment variables

Create a `.env` file in the project root based on `.env.example`:

```
SECRET_KEY=<your_django_secret_key>
DEBUG=True
DATABASE_URL=postgres://admin:admin@localhost:5432/PrimeVideo
```

### 5. Start PostgreSQL with Docker
```bash
docker run --rm --name primevideo-db \
  -e POSTGRES_PASSWORD=admin \
  -e POSTGRES_USER=admin \
  -e POSTGRES_DB=PrimeVideo \
  -p 5432:5432 \
  -d postgres:17-alpine
```

### 6. Apply migrations
```bash
python manage.py migrate
```

### 7. Load sample data
```bash
python manage.py loaddata data_backup.json
```

### 8. Run the development server
```bash
python manage.py runserver
```

### 9. Stop the database container
```bash
docker stop primevideo-db
```

---

## Project Status

> ⚠️ **Development only** — production deployment (Gunicorn + Nginx) not yet configured.

---

## Roadmap

- [ ] Production deployment with Gunicorn + Nginx
- [ ] REST API with Django REST Framework
- [ ] Recommendation engine integration

---

## Author

**RelatifVision** — [github.com/RelatifVision](https://github.com/RelatifVision)
