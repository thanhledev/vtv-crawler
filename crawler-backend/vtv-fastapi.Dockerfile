FROM python:3.12-alpine3.19

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ /backend/app
COPY res/ /backend/res

ENV PYTHONPATH="/backend/"

WORKDIR /backend/app

# Expose the port on which the application will run
EXPOSE 8888

ENV FASTAPI_MODE prod

CMD ["uvicorn", "--reload", "--host", "0.0.0.0", "--port", "8888", "crawler:app", "--proxy-headers"]
