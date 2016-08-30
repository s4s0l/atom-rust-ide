# atom-rust-ide
Docker image with complete Rust IDE based on Atom. Contains rust compiler, racer
and a bunch of atom plugins preinstalled.

## Running

```
docker run -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/shm:/dev/shm -v atom:/home/atom/.atom -e DISPLAY=$DISPLAY sasol/atom-rust-ide
```

Mounted volume will give you persistent settings.

You can also mount a project on your local filesystem:

```
docker run -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/shm:/dev/shm -v atom:/home/atom/.atom -v /path/to/your/project:/home/atom/project -e DISPLAY=$DISPLAY sasol/atom-rust-ide
```

Beware that atom in container runs as user with uid=1000, so watch out for permissions

## Exposing display

If you are getting errors like:
```
[1:1:0202/085603:ERROR:browser_main_loop.cc(210)] Gtk: cannot open display: :0
```

See http://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0/34586732#34586732, and be carefull not to do `xhost +`,
for me xhost local:root was enough.


## Using

* to compile F9
* to run Ctrl-p type 'run debug'
* to open terminal Ctrl-`
* to open docs put cursor in line with 'use ...' and press F4
* Ctrl-SPACE will give you autocompletion