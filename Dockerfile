FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1
WORKDIR /app

# Copy requirements from the subfolder (handles space in path via JSON form)
COPY ["verset de l'annee/requirements.txt", "."]
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files from the subfolder into the container
COPY ["verset de l'annee/.", "/app"]

# Production environment
ENV FLASK_ENV=production

EXPOSE 8000

# Run with gunicorn
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app:app"]
