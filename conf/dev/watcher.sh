# Shell config file, included by some watcher (build on top of reflex)

# app entrypoint
dev_entrypoint="./main.go"

# execute the entrypoint
dev_exec() {
  printf "\n -> $dev_entrypoint \n\n"
  go run $dev_entrypoint "$@"
}

# simple watch
dev_watch() {
  printf "\n -> $dev_entrypoint \n\n"
  reflex --start-service \
  -R '^local' \
  -R '^goflow' \
  -R '^docs' \
  -R '^examples' \
  -r '\.go$' \
  -- go run $dev_entrypoint "$@"
}

# watch with Delve (Go debugger)
dev_watch_debug() {
  dev_watch \
  -- sh -c \
  "dlv debug $dev_entrypoint --headless=true --listen=0.0.0.0:2345 --api-version=2"
}
