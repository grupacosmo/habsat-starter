# HabSat

### Introduction

TODO: High level project description.

### Project requirements

* docker (recommended version: `latest`)
* docker-compose (recommended version: `latest`)
<!-- * make (recommended version: `latest`) -->

### How to start working with project?

1. Clone this repository with following command.  
    ```shell
    git clone git@github.com:grupacosmo/habsat-starter.git --recursive
    ```
   This will download all submodules of the project. Optionally, you can omit the `--recursive` flag and download
   the selected submodules manually using the following command.
   ```shell
   git submodule update --init services/<service-name>
   # Example:
   git submodule update --init services/gateway
   ```
2. Create your own version of `docker-compose.dev.yaml` and name it `docker-compose.yaml`.
   This file will be used for local development and must not be added to the repository.
   ```shell
   cp docker-compose.dev.yaml docker-compose.yaml
   ```
3. Now you cen start project with following command.
   ```shell
   docker-compose up
   # Or as follow if you want to run project in background:
   docker-compose up -d
   ```
   This may take some time when you are running project for the first time as docker has to download images of all 
   services. The following launches will be faster.
4. By default, all services run from docker images. For repositories, you intend to work with, you need to replace 
   the `image` property with `build` property in `docker-compose.yaml`. Following example show what to do if you want 
   to start `gateway` from your local version of code. 
   ```shell
   # Before
     gateway:
       image: cosmopk/habsat-gateway:master
   
   # After
     gateway:
       build: services/gateway
   ```
   After any changes in `docker-compose.yml` you need to restart the project (same command as in paragraph 3).

### Application URLs

* `api.habsat.localhost`
* `naming-server.habsat.localhost`
* `config-server.habsat.localhost`

---

### Hints

##### How to add a new submodule

```shell
git submodule add [--name <name>] [--] <repository> [<path>]
// E.g.
git submodule add --name post-service git@github.com:grupacosmo/habsat-post-service.git  services/post-service
```
