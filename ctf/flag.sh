#!/bin/sh
# Places the player's flags (CTF_FLAG_MAIN, CTF_FLAG_SQL_INJECTION, given by the launcher) in the
# ctf volume; without them (CI, a run by hand) the development flags. The machine's
# ctf-entrypoint.sh does the same at every start (setup.py loads the SQL injection flag into the
# table flags from there).
dev_main='FLAG{dev-dvga}'
dev_sql='FLAG{dev-dvga-sql-injection}'
printf '%s\n' "${CTF_FLAG_MAIN:-$dev_main}" > /ctf/flag.tmp && mv -f /ctf/flag.tmp /ctf/flag
printf '%s\n' "${CTF_FLAG_SQL_INJECTION:-$dev_sql}" > /ctf/sql-injection.tmp && mv -f /ctf/sql-injection.tmp /ctf/sql-injection
chmod 444 /ctf/flag /ctf/sql-injection
