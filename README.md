# HabSat

### Introduction

TODO: High level project description.

### Project requirements

* docker (recommended version: `latest`)
* docker-compose (recommended version: `latest`)
* make (recommended version: `latest`)

### How to start working with this project?

1. Clone this repository with following command.  
    ```shell
    git clone git@github.com:grupacosmo/habsat-starter.git --recursive
    ```
2. Run following commands to prepare your local environment and start project.
   ```shell
   make init
   make start
   ```
3. By default, all services are started from docker images. For repositories, you intend to work with, you need to 
   override the `image` property with `build` property in `docker-compose.yaml`. Following example show what lines
   you have to add under `services` section in `docker-compose.yaml` when you want to start `gateway` from your 
   local version of code. For other services you just have to replace `gateway` with appropriate service name like
   `post-service`, `user-service`, etc.
   ```shell
     gateway:
       image: cosmopk/habsat-gateway:master
   ```
   When you are doing it for the first time you also have to uncomment `services` property (just remove hash `#` sign).</br>
   After any changes in `docker-compose.yml` you need to restart the project (same command in paragraph 2).

### Application URLs

* `api.habsat.localhost` - application entry point (gateway)
* `api.habsat.localhost/docs` - api documentation
* `naming-server.habsat.localhost` - naming server dashboard

---

### Hints

##### How to add a new submodule

```shell
git submodule add [--name <name>] [--] <repository> [<path>]
// E.g.
git submodule add --name post-service git@github.com:grupacosmo/habsat-post-service.git  services/post-service
```
