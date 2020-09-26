# Mysterium Node

Docker Multiarch Node specific Image

### Prerequisite

You must have myst.db and keystore folder

 - Place keystore folder here
 - Create directory `db` and place `myst.db` inside it

### Building docker image

I prefer to build image using buildx so enable the experimental feature from docker desktop

```bash
docker buildx build --no-cache --platform linux/arm64,linux/amd64 -t arpitjindal1997/myst-multiarch:hash . --push
```

### Running the image

```bash
docker run --cap-add NET_ADMIN -p 4449:4449 -d --dns 94.140.14.14 --rm  arpitjindal1997/myst-multiarch:hash service --agreed-terms-and-conditions
```
