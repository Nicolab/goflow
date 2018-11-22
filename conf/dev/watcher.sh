# Shell config file, included by some watcher (build on top of reflex)

# app entrypoint
dev_entrypoint="./main.go"

# simple watch
dev_watch() {
  go run $dev_entrypoint \
  && reflex -g '*.go' go run $dev_entrypoint
}

# watch with Delve (Go debugger)
dev_watch_debug() {
  reflex --start-service -g '*.go' -- sh -c \
  "dlv debug $dev_entrypoint --headless=true --listen=0.0.0.0:2345 --api-version=2"
}