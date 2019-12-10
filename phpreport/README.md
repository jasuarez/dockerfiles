# PhpReport

This dockerfile creates a docker container with
[PhpReport](https://github.com/Igalia/phpreport) for testing / demoing purposes.


## Building

Building the container is as easier as running:

```
docker build -t phpreport .
```

inside the directory containing this Dockerfile.

You can tag the container as `phpreport` or as any other name, as you wish.


## Running

Again, running the container is as easier as executing:

```
docker run -p 8080:80 phpreport
```

And opening http://localhost:8080/phpreport in your browser. Here we are using
the port 8080, but you can choose a different one.

The default username and password is `admin` / `admin`. This is the
administrator, and from here you can create new users.

As the intent of this dockerfile is for testing purposes, the recorded
information is lost whenever the container is closed. If you want persistance,
you can create a docker volume and attach it:

```
docker volume create phpreport
docker run -p 8080:80 phpreport:/var/lib/postgresql phpreport
```

Here we have named the volume as `phpreport` but again, you can choose whatever
name you prefer.
