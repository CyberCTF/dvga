# CyberCTF: puts the player's SQL injection flag (written to /ctf by ctf-entrypoint.sh) in a
# table of its own, flags, each time setup.py rebuilds the database.
import os
import sqlite3

import config


def place():
    flag = 'FLAG{dev-dvga-sql-injection}'
    path = '/ctf/sql-injection'
    if os.path.isfile(path) and os.path.getsize(path) > 0:
        with open(path) as f:
            flag = f.read().strip()
    db = sqlite3.connect(config.SQLALCHEMY_FILE)
    db.execute('CREATE TABLE IF NOT EXISTS flags (flag varchar(255) NOT NULL)')
    db.execute('DELETE FROM flags')
    db.execute('INSERT INTO flags (flag) VALUES (?)', (flag,))
    db.commit()
    db.close()
