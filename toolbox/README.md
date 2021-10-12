Dockerfiles to build toolbox-based containers for specific needs.

First, build the image:

- `podman build -t mesa mesa`

From now on, you can use toolbox to check the available images:

- `toolbox list -i`

Use the created image to build the toolbox container:

- `toolbox create -i localhost/mesa:latest mesa`

Now you can enter in the `mesa` container:

- `toolbox enter mesa`
