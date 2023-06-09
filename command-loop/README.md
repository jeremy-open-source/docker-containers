# command loop container

I needed a simple container to run a few commands continuously in a loop like nmap and curl, so I created this quickly

## Docker Usage
```
docker run --rm registry.gitlab.com/jeremy-open-source/docker-container/command-loop:latest nmap -sP 1.2.3.4/32

```

## Development Usage

To run nmap against a single host:
```
docker-compose run --rm app nmap -sP 1.2.3.4/32
```
