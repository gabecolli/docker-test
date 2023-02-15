#pulling the python image

FROM python:3.8-alpine

#copy the requirements file into the image

COPY ./requirements.txt /app/requirements.txt

#switch the working directory
WORKDIR /app

#install your dependencies 

RUN pip install -r requirements.txt

#copy all content from the local path to your working directory

COPY . /app

# configure the container to run in an executed manner
ENTRYPOINT [ "python" ]

CMD ["main.py" ]