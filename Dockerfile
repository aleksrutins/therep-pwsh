# pull down the pode image
FROM badgerati/pode.web

RUN apt-get update && apt-get install -y postgresql-client

# copy over the local files to the container
COPY . /usr/src/app/

# run the server
CMD [ "pwsh", "-c", "cd /usr/src/app; ./main.ps1" ]