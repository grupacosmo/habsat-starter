# Work with project on local environment

## Quickstart

1. Clone `habsat-starter` repository with the following command.
   ```shell
   git clone git@github.com:grupacosmo/habsat-starter.git --recursive
   ```
2. Run the following command to prepare your local environment and start the project.
   ```shell
   make init start
   ```

## Application service urls

- `api.habsat.localhost` - application entry point (gateway)
- `api.habsat.localhost/docs` - api documentation
- `naming-server.habsat.localhost` - naming server dashboard

## Service interactive and standalone mode

By default, all services are started in a mode called `standalone`, which means that containers with services are launched using pre-built images stored on DockerHub. If you want one of the services to be built from your local version of files, you must switch it to a mode called `interactive`. You can do this by running the following commands.

```
make interactive service=<SERVICE_NAME>
make restart
```

In place of `<SERVICE_NAME>`, you must enter the name of the service that you want to run in interactive mode. Allowed values are:

- gateway
- naming-server
- authorization-server
- email-service
- post-service
- user-service
- flight-service

### Two version of interactive containers

Additionally, by running interactive mode, you can specify which stage of the Dockerfile should be built. There are two options available, dev (default) and release. The dev option allows you to use hot-reload functionality, meaning you don't have to rebuild the container manually when you make code changes. On the other hand, the release option ensures that the built container will be identical to the one used in production.
To specify the build target, execute the previous command as follows.

```
make interactive service=<SERVICE_NAME> target=<TARGET> restart
```

Where `<TARGET>` is one of the allowed values:

- dev
- release

### Back to standalone mode

When you finish working with the service you may turn it back into `standalone` mode with following command.

```
make standalone service=<SERVICE_NAME>
make restart
```

In place of `<SERVICE_NAME>`, you must enter the name of the service that you want to run in interactive mode. Allowed values are same as for command to turn service into `interactive` mode.
