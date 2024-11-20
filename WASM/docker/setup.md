If you're running on Docker Desktop, ensure that:
- You turn on Containerd images (Settings > General > Use containerd for pulling and storing images)
- Turn on WASM (Settings > Features in development > Enable Wasm)

```
docker buildx build --platform wasi/wasm -t gowasm .
```

```
docker run --rm --runtime=io.containerd.wasmedge.v1 --platform=wasi/wasm gowasm:latest
```