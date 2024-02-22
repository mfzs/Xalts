FROM  python:3.7
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 8080
# Command to run the app
ENTRYPOINT ["python", "flask-health-api.py"]