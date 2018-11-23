# Shell config file, included by some watcher (build on top of reflex)

# app entrypoint
dev_entrypoint="./main.go"

# execute the entrypoint
dev_exec() {
  printf "\nExec $dev_entrypoint \n\n"
  go run $dev_entrypoint
}

# simple watch
dev_watch() {
  dev_exec && reflex -g '**/*.go' -- dev_exec
}

# watch with Delve (Go debugger)
dev_watch_debug() {
  reflex --start-service -g '**/*.go' -- sh -c \
  "dlv debug $dev_entrypoint --headless=true --listen=0.0.0.0:2345 --api-version=2"
}