#!/bin/sh
# CyberCTF per-player flags, added by the overlay (the vendored source is unchanged).
# At every start: each flag comes from its variable (given by the launcher), else the file
# ctf/flag.sh wrote on an earlier start, else the development flag. The command-injection flag
# goes to /ctf/flag; the SQL injection one to /ctf/sql-injection, which setup.py loads into the
# table flags. Then the app starts exactly as before.
put() { # put <file> <value> <dev>
  v=$2
  if [ -z "$v" ] && [ -s "$1" ]; then return; fi
  [ -n "$v" ] || v=$3
  printf '%s\n' "$v" > "$1.tmp" && mv -f "$1.tmp" "$1" && chmod 444 "$1"
}
dev_main='FLAG{dev-dvga}'
dev_sql='FLAG{dev-dvga-sql-injection}'
put /ctf/flag "${CTF_FLAG_MAIN:-}" "$dev_main"
put /ctf/sql-injection "${CTF_FLAG_SQL_INJECTION:-}" "$dev_sql"
unset CTF_FLAG_MAIN CTF_FLAG_SQL_INJECTION
exec "$@"
