#!/bin/sh
# >>> isoloom-1.0 secret-from-file shim (auto-added by convert-lab.py) >>>
# Inputs now arrive as files (isoloom.yml `files:`), not environment variables.
# Read each into its old variable when unset, keeping the dev/CI fallback working.
for __p in CTF_FLAG_MAIN:/run/lab/ctf_flag_main CTF_FLAG_SQL_INJECTION:/run/lab/ctf_flag_sql_injection; do
  __n=${__p%%:*}; __f=${__p#*:}
  eval "__v=\${$__n:-}"
  if [ -z "$__v" ] && [ -s "$__f" ]; then
    __v=$(tr -d '\r\n' < "$__f"); eval "export $__n=\"\$__v\""
  fi
done
unset __p __n __f __v 2>/dev/null || true
# <<< isoloom-1.0 secret-from-file shim <<<
# Places the player's flags (CTF_FLAG_MAIN, CTF_FLAG_SQL_INJECTION, given by the launcher) in the
# ctf volume; without them (CI, a run by hand) the development flags. The machine's
# ctf-entrypoint.sh does the same at every start (setup.py loads the SQL injection flag into the
# table flags from there).
dev_main='FLAG{dev-dvga}'
dev_sql='FLAG{dev-dvga-sql-injection}'
printf '%s\n' "${CTF_FLAG_MAIN:-$dev_main}" > /ctf/flag.tmp && mv -f /ctf/flag.tmp /ctf/flag
printf '%s\n' "${CTF_FLAG_SQL_INJECTION:-$dev_sql}" > /ctf/sql-injection.tmp && mv -f /ctf/sql-injection.tmp /ctf/sql-injection
chmod 444 /ctf/flag /ctf/sql-injection
