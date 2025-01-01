# docker-jo

Multi platform docker build for https://github.com/jpmens/jo

# Usage

```
$ docker run --rm fukayatsu/jo foo=bar
```

# dev: push to dockerhub

```
$ docker buildx build --push -t fukayatsu/jo -t fukayatsu/jo:1.9 --platform linux/amd64,linux/arm64 .
```
