To run container:
```
docker run \
    --volume "<path_to_letsencrypt>:/etc/letsencrypt" \
    --publish 9081:9081 \
```

Then manually create the certificates in the container (certbot certonly --standalone -d <DOMAIN> --http-01-port 9081 -m <EMAIL>)