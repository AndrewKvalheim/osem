# Trial of upstream OSEM

This branch provides a database migration script, application configuration, and
Docker environment with which SeaGL can preview migration to [upstream] OSEM.

As a base it uses [`AndrewKvalheim:future`][andrewkvalheim:future], which merges
several prospective upstream pull requests onto `openSUSE:master`.

## Usage

Install/acquire dependencies:

- [Docker Engine][] and [Docker Compose][]
- a database dump from SeaGL's OSEM instance

Configure the environment:

```bash
generate_secret() { </dev/urandom tr -dc 'A-Za-z0-9' | head -c "$1" ; }

sed -e "s/\(OSEM_DB_PASSWORD=\).*/\\1$(generate_secret 32)/" \
    -e "s/\(SECRET_KEY_BASE=\).*/\\1$(generate_secret 64)/" \
    'dotenv.production.example' > '.env.production'
```

Build images:

```bash
docker build --file 'Dockerfile.base' --tag 'osem/base' '.'
docker-compose --file 'docker-compose.production.yml' build
```

Import and migrate the database:

```bash
./bin/trial-import 'backup-osem1prod.sql.xz'
```

Start the server at [`localhost:8080`](http://localhost:8080/):

```bash
docker-compose --file 'docker-compose.production.yml' --env-file '.env.production' up
```

Clean up:

```bash
docker-compose --file 'docker-compose.production.yml' down --rmi 'all' --volumes
docker rmi 'osem/base'
```

[andrewkvalheim:future]: https://github.com/AndrewKvalheim/osem/commits/future
[docker compose]: https://docs.docker.com/compose/
[docker engine]: https://docs.docker.com/engine/
[upstream]: https://github.com/openSUSE/osem
