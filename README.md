# docker-presto

docker image of presto

### environment variables

|name                 |default                  | description                           |
| ---                 | ---                     | ---                                   |
|NODE_TYPE            | `standalone`            | `standalone`, `coordinator`, `worker` |
|NODE_ID              | random uuid value       | node id                               |
|JVM_MIN_HEAP_SIZE    | `512M`                  | use to `-Xms`                         |
|JVM_MAX_HEAP_SIZE    | `1024M`                 | use to `-Xmx`                         |
|JVM_HEAP_REGION_SIZE | `32M`                   | use to `-XX:G1HeapRegionSize"`        |
|MAX_MEMORY           | `${JVM_MIN_HEAP_SIZE}B` | maximum memory size of cluster        |
|MAX_MEMORY_PER_NODE  | `${JVM_MIN_HEAP_SIZE}B` | maximum memory size of each node      |
|DISCOVERY_URI        | `http://localhost:8080` | discovery server's URL                |
|LOG_LEVEL            | `INFO`                  | `DEBUG`, `INFO`, `WARN`, `ERROR`      |

### presto-cli

``` abap
docker run --rm -it passant/presto:latest presto-cli --server <server>
```
