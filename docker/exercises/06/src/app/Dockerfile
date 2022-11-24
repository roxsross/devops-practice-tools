FROM python:3.10.8-alpine
WORKDIR /app
RUN pip install Flask
COPY ./ /app/
EXPOSE 8000
CMD ["python","app.py"]