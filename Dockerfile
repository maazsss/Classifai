# Builds the website, then runs the Classifai server (Flask + the SVM) which also serves the website.
FROM node:22-slim AS web
WORKDIR /web
COPY frontend/package*.json ./
RUN npm ci
COPY frontend/ ./
RUN npm run build

FROM python:3.12-slim
ENV PYTHONUNBUFFERED=1 TRUST_PROXY=1 SITE_DIR=/app/site
WORKDIR /app/backend
COPY backend/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY backend/ ./
COPY --from=web /web/dist /app/site
# Hugging Face Spaces uses port 7860; Render sets $PORT itself.
ENV PORT=7860
EXPOSE 7860
CMD gunicorn app:app --bind 0.0.0.0:${PORT} --workers 1 --threads 4 --timeout 120
