# Go Flow

A base workflow for Golang projects, layout inspired by the [Golang standards](https://github.com/golang-standards/project-layout).

Docker + Golang + inspiration from standards.

* [Examples: Minimal Go Flow Project Layout](examples/minimal-goflow-project-layout)
* [Proposals](docs/dev/proposals)
* [Proposals: Basic project layout](docs/dev/proposals/basic-project-layout.md)


## Quick Start

Goflow must be installed from a clean repository (existing and nothing to validate).

> Create a new one if needed:

```sh
git init
echo 'TODO' > ./README.md
git add .
git commit -m "Initial commit"
```

Get _goflow_ directory, in an existing Git repository:

```sh
# get the goflow subtree
git remote add goflow git@github.com:Nicolab/goflow.git
git fetch goflow
git subtree add --prefix=goflow --squash goflow master

# create the Docker volume folder
mkdir ./goflow/build/dev/.go
```

Edit the config file: _./goflow/conf/dev/docker.sh_ (mainly: `dev_container_name`).

> From now on you need the files of your project (go.mod, main.go).  
> If your project directory is empty, you can use the [minimal Go Flow Project Layout](examples/minimal-goflow-project-layout) as inspiration (or starter kit).

Then, always from your project directory:

```sh
./goflow/build/dev/build-image # create goflow-dev image
./goflow/scripts/dev/console # run the container and get a shell inside
```

Now, from the container:

```sh
./goflow/scripts/dev/install-container-stack
./goflow/scripts/dev/watch # or ./goflow/scripts/dev/watch-debug
```

It's installed!  
Happy Coding in the Go flow ;)


## Usage

### Config

See the [config files](goflow/conf/dev).

### Host

Run/exec the _goflow-dev_ container:

```sh
./goflow/scripts/dev/console
```

Stop and remove _goflow-dev_ container:

```sh
./goflow/scripts/dev/rm-container
```

### Container

Execute the _Go_ program (`go run` by default):

```sh
./goflow/scripts/dev/exec
```

Run the _Go_ program and watch the code change (for reloading):

```sh
./goflow/scripts/dev/watch
```

Same with [Delve](https://github.com/derekparker/delve):

```sh
./goflow/scripts/dev/watch-debug
```

Now, you can connect your favorite code editor to the Delve server.

> From the host you can also exec: `dlv connect localhost:2345`  
> or in one: `dlv connect localhost:2345 & ./goflow/scripts/dev/console`


## How to Update

If you need to keep your _Go Flow_ up to date with the recent changes made to _Go Flow project_,
you can always fetch and merge them from this repo back into your own project:

```sh
git pull -s subtree goflow master --allow-unrelated-histories
```

> `--allow-unrelated-histories` prevent that Git _refusing to merge unrelated histories_.

### Update the remote tracking

If you want to add or to update a remote branch to track:

```sh
git remote add -t master goflow git@github:Nicolab/goflow.git
```

> ```git remote add -t remote-branch remote-name remote-url```  
You can use multiple "-t branch" options to grab multiple branches.


## How to uninstall

Remove the _goflow_ directory:

```sh
rm -rf goflow
```

Remove the remote URL:

```sh
git remote rm goflow
```

> Verify it's gone: `git remote -v`  
> Note: `git remote rm` does not delete the remote repository from the server. It simply removes the remote and its references from your local repository.


## Tips

### .bashrc

To customize the `.bashrc` file, you can mount the `.bashrc` file in volume via `./goflow/conf/dev/docker.sh` file.

Example:

```sh
-v "${PWD}"/goflow/build/dev/files/.bashrc:/home/gopher/.bashrc \
```

> You can mount as many files and folders as you want. It's a simple Docker command that you can customize at will!


## Troubleshooting

### Max user files watches

If you reach the default limit of your OS, you should increase the amount of inotify watchers.

> If you are running Debian, RedHat, or another similar Linux distribution, run the following in a terminal that set a new limit temporary:

```sh
sudo sysctl fs.inotify.max_user_watches=524288 \
&& sudo sysctl -p \
&& cat /proc/sys/fs/inotify/max_user_watches
```


## TODO

 * [ ] Handle locales in build/dev/Dockerfile.
 * [ ] Improve the concept (symplify the install, usage and add more docs).


## LICENSE

[MIT](https://github.com/Nicolab/goflow/blob/master/LICENSE) (c) 2018, Nicolas Tallefourtane.


## Author

| [![Nicolas Tallefourtane - Nicolab.net](https://www.gravatar.com/avatar/d7dd0f4769f3aa48a3ecb308f0b457fc?s=64)](https://nicolab.net) |
|---|
| [Nicolas Talle](https://nicolab.net) |
| [![Make a donation via Paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=PGRH4ZXP36GUC) |

