# Make commands

**init** - prepare local environment for development. This will pull for you all submodules of this repository and initiate base docker composition.

**start** - runs all docker services.

**stop** - stops all docker services.

**restart** - force rebuild and restart all docker services.

**prune** - stops all docker services and removes volumes (this means you will lose data datastore services like e.g. `mongo`).

**interactive** - starts service in interactive mode, this means service will be build from files in your local environments instead of pre-built image.

Parameters:

- `service` (required) - defines which service should be started into interactive mode. Allowed options are: `gateway`, `naming-server`, `authorization-server`, `email-service`, `post-service`, `user-service`, `flight-service`
- `target` (optional, default: `dev`) - defines docker target to build. Allowed options are: `dev` - allows live code reloading inside container during development, `release` - build containers same as for production servers.

**standalone** - revert service to standalone mode, this means service will be build from pre-built image instead of files in your local environments.

**restart-gateway** - restarts `gateway` service.

**pull-submodules** - pull all git submodules at once from remote branches.
