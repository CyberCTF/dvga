# Upstream

| | |
| --- | --- |
| Project | Damn Vulnerable GraphQL Application (DVGA) |
| Repository | https://github.com/dolevf/Damn-Vulnerable-GraphQL-Application |
| Version | 2.2.0 |
| Commit | a961308c02d1fb462b192681c336b0739e432da7 |
| Licence | MIT |

`build/dvga/app/` is that commit, unchanged, without its Git history. `build/dvga/Dockerfile` is
upstream's Dockerfile with one change: `WEB_HOST=0.0.0.0` is baked in (upstream's README passes it
to `docker run`). Dependencies are pinned by upstream's `requirements.txt`, except `flask-sockets`,
which it installs from the master branch of dolevf/flask-sockets (last commit 2022-12-12). To
update, replace `build/dvga/app/` with a newer release, then change this table.
