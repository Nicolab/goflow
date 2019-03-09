# Shell config file, included by some Docker scripts

# Docker image
dev_goflow_image="local/goflow-dev"
dev_goflow_image_path="./goflow/build/dev"

# Docker container
dev_container_name="app-go-dev"


#
# Commands:
#

# Install inside the dev container
dev_install_container_stack() {
  go get github.com/cespare/reflex;
  go get github.com/go-delve/delve/cmd/dlv;
  # go get github.com/divan/expvarmon;
}

# Run the container (executed from host)
dev_docker_run() {
  # dlv connect localhost:2345 & \
  docker run --rm --name $dev_container_name \
    -v "${PWD}"/:/home/go \
    -v "${PWD}/goflow/build/dev/.go":/go \
    -v "${PWD}"/goflow/build/dev/files/.bashrc:/home/gopher/.bashrc \
    -v "${PWD}"/goflow/build/dev/files/.gitconfig:/home/gopher/.gitconfig \
    -v "${PWD}"/goflow/build/dev/files/.ssh/config:/home/gopher/.ssh/config \
    --security-opt="seccomp:unconfined" --cap-add=SYS_PTRACE -p 2345:2345 \
    -it $dev_goflow_image /bin/bash

  # NOTE: work around for Delve:
  # --security-opt="seccomp:unconfined" --cap-add=SYS_PTRACE -p 2345:2345

  # NOTE: useful volumes:
  # -v "${PWD}"/goflow/build/dev/files/.bashrc:/home/gopher/.bashrc \
  # -v "${PWD}"/goflow/build/dev/files/.gitconfig:/home/gopher/.gitconfig \
  # -v "${PWD}"/goflow/build/dev/files/.ssh/config:/home/gopher/.ssh/config \
  # -v "${HOME}"/.ssh/id_rsa_git:/home/gopher/.ssh/id_rsa_git \
}
