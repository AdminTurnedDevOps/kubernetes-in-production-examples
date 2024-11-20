```
GOOS=wasip1 GOARCH=wasm go build -o main.wasm main.go
```

```
wasmtime main.wasm
```