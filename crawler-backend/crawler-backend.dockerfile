FROM python:3.12-alpine3.19

COPY requirements.txt /requirements.txt
RUN pip install --no-deps -r requirements.txt \
pip install uvicorn

COPY app/ /backend/app
COPY res/ /backend/res

ENV PYTHONPATH="/backend/"
ENV MODE=prod

WORKDIR /backend

# Expose the port on which the application will run
EXPOSE 8888

#CMD ["uvicorn", "--reload", "--host", "0.0.0.0", "--port", "8000", "app:app"]
CMD ["python3", "main.py"]
