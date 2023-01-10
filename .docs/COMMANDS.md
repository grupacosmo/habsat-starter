# Makefile commands documentation

The following documentation adopts the following few rules:

- parameters wrapped in angle bracket `<PARAM>` are required.
- parameters wrapped in square bracket `[PARAM]` are optional.
- if there is a colon after the parameter symbolic name `[PARAM:default_value]`, it means that the value after it is the default value for parameter.

## Initialize project

```
make init
```

This will update all git submodules and prepare the basic `.env` and `docker-compose.yaml` if they are not already exist.

## Start project

```sh
make start
```

Starts containers defined in docker-compose files for this project.

## Force rebuild container

```sh
make start-and-build
```

Starts containers defined in docker-compose files for this project with `--build` flag.

## Stop project

```sh
make stop
```

Stops containers defined in docker-compose files for this project.

## Stop project and clear volumes

```sh
make prune
```

Stops containers defined in docker-compose files for this project with `-v` flag which removes the named volumes. This means you will lose any data stored in local datastores like `mongo` etc.

## Restart service

```sh
make restart service=<SERVICE>
```

Restarts container for given service.

### Parameters

- `<SERVICE>` - the name of the service to restart. Allowed values are: `gateway`, `naming-server`, `authorization-server`, `email-service`, `post-service`, `user-service`, `flight-service`.

## Pull service images

```sh
make pull
```

Pulls actual container versions from DockerHub.

## Print service logs

```sh
make logs service=[SERVICE]
```

Print logs from given service do standard output.

### Parameters

- `<SERVICE>` - the name of the service to switch to interactive mode. Allowed values are: `gateway`, `naming-server`, `authorization-server`, `email-service`, `post-service`, `user-service`, `flight-service`. If no service is provided this command will print logs from all containers.

## Turn service into interactive mode

```sh
make interactive service=<SERVICE> target=[TARGET:dev]
```

### Parameters

- `<SERVICE>` - name of the service to switch to interactive mode. Allowed values are: `gateway`, `naming-server`, `authorization-server`, `email-service`, `post-service`, `user-service`, `flight-service`
- `[TARGET]` - target from `Dockerfile` that should be used for interactive container.
  - `dev` - builds container with hot-reload feature.
  - `release` - builds container same as the one used for production.

### Errors

- `Error 10` - Unknown or invalid service name for `<SERVICE>` parameter
- `Error 20` - Unknown or invalid target for `[TARGET]` parameter

### Notice

Don't forgot to call `make restart` after this command to restart containers with new configuration.

## Turn service into standalone mode

```sh
make standalone service=<SERVICE>
```

### Parameters

- `<SERVICE>` - the name of the service to switch to standalone mode. Allowed values are: `gateway`, `naming-server`, `authorization-server`, `email-service`, `post-service`, `user-service`, `flight-service`

### Errors

- `Error 10` - Unknown or invalid service name for `<SERVICE>` parameter

### Notice

Don't forgot to call `make restart` after this command to restart containers with new configuration.

## Update git submodules

```sh
make update-submodules
```

Updates all git submodule.
