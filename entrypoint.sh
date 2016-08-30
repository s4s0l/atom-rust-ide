#!/bin/bash
set -e

if [ "$1" = 'atom' ]; then
    if [ ! -f /home/atom/project/Cargo.toml ]; then
        echo "Initializing /home/atom/project"
        cp -R /home/atom/project_template/* /home/atom/project
    fi
    if [ ! -f /home/atom/.atom/config.cson ]; then
        echo "Initializing /home/atom/.atom"
        cp -R /home/atom/.atom_template/* /home/atom/.atom
    fi
    chown -R atom:atom /home/atom/.atom
    chown -R atom:atom /home/atom/project
    exec gosu "$@"
fi

exec "$@"