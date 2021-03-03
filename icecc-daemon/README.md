This dockerfile provides an icecc daemon node ready to assist in
compiling tasks.

It can be configured with the architecture to generate code.


# Building

Let's suppose for instance you have an `arm32` device and you want to
use your host to assist when building in that device. In this case,
you can build an arm32 icecc daemon node and then launch it to receive
and compile jobs from the arm32 device.

In this example, to build the container:

```
docker build --build-arg ARCH=arm32v7 . -t icecc-daemon-arm32v7
```


# Running

Following the same example, you can run the new container by calling:

```
docker run -it --net=host -e ICECCD_NAME=$HOSTNAME-arm32v7 -d --restart=unless-stopped icecc-daemon-arm32v7

```

Here I'm setting the name of the icecc daemon to the hostame +
architecture, but you could use any other value.

Your host is now ready to receive and build arm32 jobs (keep in mind
you need to have an icecc scheduler running, and also use icecc in
your arm32 device).


# Available containers

You can find out some containers already built in my [Docker
hub](https://hub.docker.com/u/jasuarez).


# Credits

This is based on [Carlos
Barraco](https://github.com/cbarraco/icecc-daemon) work.
