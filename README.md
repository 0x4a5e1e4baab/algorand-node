# Algorand Node

Run Algorand in a Docker container



### Build

```
docker build -t algorand .
```

### Running


```
docker run -d -p 8080:8080 --name algorand bjweaver/algorand-node

To run on testnet:

docker run -d -p 8080:8080 --name algorand bjweaver/algorand-node:testnet
```

### Status

To obtain node status using `docker exec`

```
docker exec algorand /algorand/node/goal node status -d /algorand/node/data
```

Alternatively on your server copy the contents of [bin](./bin) to `/usr/bin`, you can now run Algorand cli tools from the host against the Docker container using `docker exec`

```
goal node status
```

## API connection

API will listen on localhost:8080

```
curl 127.0.0.1:8080/swagger.json
```
