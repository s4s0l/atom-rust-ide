# atom-rust-ide
Docker image with complete Rust IDE based on Atom. Contains rust compiler, racer
and a bunch of atom plugins preinstalled.

## Running

Run with atom-rust-ide.sh script (see below) or by hand:

```
docker run -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/shm:/dev/shm -v atom:/home/atom/.atom -e DISPLAY=$DISPLAY sasol/atom-rust-ide
```

Mounted volume will give you persistent settings.

You can also mount a project on your local filesystem:

```
docker run -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/shm:/dev/shm -v atom:/home/atom/.atom -v /path/to/your/project:/home/atom/project -e DISPLAY=$DISPLAY sasol/atom-rust-ide
```

Beware that atom in container runs as user with uid=1000, so watch out for permissions. When container starts
and sees /home/atom/.atom or /home/atom/project is empty container will copy there its defaults
and change permissions to mach container user 'atom' uid 1000, so mounted directories will have 
owner with uid 1000, so be sure its ok for you.


## Exposing display

If you are getting errors like:
```
[1:1:0202/085603:ERROR:browser_main_loop.cc(210)] Gtk: cannot open display: :0
```

See http://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0/34586732#34586732, and be carefull not to do `xhost +`,
for me xhost local:root was enough.

## Convinient way of opening container 

atom-rust-ide.sh is a script that starts new container or resumes previous one.
When executed without params mounts named volumes for settings and sample project,
so they will be persisted. 
Additionally you can pass a directory as first parameter - it will start 
container with this directory mounted as project dir.
 
Watch out: each directory will have its own container!

## Using

* to compile F9
* to run Ctrl-p type 'run debug'
* to open terminal Ctrl-`
* to open docs put cursor in line with 'use ...' and press F4
* Ctrl-SPACE will give you autocompletion