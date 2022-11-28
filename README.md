### Cloning a repository that has submodules

```sh
git clone <domain/repository.git> --recursive
```

### How to add a submodule

```sh
git submodule add [--name <name>] [--] <repository> [<path>]
// E.g.
git submodule add --name post-service git@github.com:grupacosmo/habsat-post-service.git  services/post-service
```

### Local development

```sh
cp docker-compose.dev.yaml docker-compose.yaml
```