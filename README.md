# Mysterium Node

### Prerequisite

You must have myst.db and keystore folder

place keystore folder here
Create directory `db` and place `myst.db` inside it

### Building docker image

I prefer to build image using buildx so enable the experimental feature from docker desktop

```bash
docker buildx build --no-cache --platform linux/arm64,linux/amd64 -t arpitjindal1997/myst-multiarch:latest . --push
```

### Running the image

```bash
docker run --cap-add NET_ADMIN -p 4449:4449 -d --rm  arpitjindal1997/myst-multiarch:latest
```