# DVGA

[Damn Vulnerable GraphQL Application](https://github.com/dolevf/Damn-Vulnerable-GraphQL-Application)
by Dolev Farhi and Nick Aleks: a deliberately weak GraphQL API (a paste service) for learning and
practising GraphQL security. This repository runs it with [Isoloom](https://www.isoloom.com):
[`isoloom.yml`](isoloom.yml) describes the machine, and the upstream source in
[`build/dvga/app/`](build/dvga/app) builds with its own Dockerfile, with the listen address baked in.

| Machine | Service |
| --- | --- |
| dvga | DVGA on port 5013 |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:5013/. The GraphQL endpoint is `/graphql` and GraphiQL is at
`/graphiql`; choose the Beginner or Expert mode from the menu. The same spec runs as Docker on a
local VM (`docker-vm`), on a cloud VM (`cloud-docker`) or on Kubernetes. Lab guide: the solutions
page of the application and the
[DVGA README](https://github.com/dolevf/Damn-Vulnerable-GraphQL-Application#readme).

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

MIT, as DVGA ([LICENSE](LICENSE)). This application is deliberately vulnerable: keep it isolated.
