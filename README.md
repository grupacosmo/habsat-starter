### Cloning a repository that has submodules

```shell
git clone <domain/repository.git> --recursive
```

### How to add a submodule

```shell
git submodule add [--name <name>] [--] <repository> [<path>]
// E.g.
git submodule add --name post-service git@github.com:grupacosmo/habsat-post-service.git  services/post-service
```

### Local development

```shell
cp docker-compose.dev.yaml docker-compose.yaml
```

### 

```shell
config-server.habsat.localhost
naming-server.habsat.localhost
api.habsat.localhost
```