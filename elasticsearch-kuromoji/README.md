# elasticsearch-kuromoji

https://hub.docker.com/r/aramassa/elasticsearch-kuromoji

## build

```
export VERSION="enter_your_prefered_version"
docker build -t aramassa/elasticsearch-kuromoji:${VERSION} --build-arg ES_VERSION=${VERSION} .
docker push aramassa/elasticsearch-kuromoji:${VERSION}
```
