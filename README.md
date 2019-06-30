# docker-pi-gameboy.live
gameboy.live docker package for pi

# Build example

```bash
docker build -t ecat/docker-pi-gameboy.live:latest  .
```

# Run example

```bash
docker run \
	--name gbdotlive
	-v /docker/gbdotlive_data:/data \
	-p 1989:1989 \
	ecat/docker-pi-gameboy.live
```
