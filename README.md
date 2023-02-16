# BLUSE kernels container

The files here can be used to create a Singularity container with software
environments for analyzing Breakthrough Listen data in Jupyter notebooks
running on JupyterHub.

# Building the container

The easiest way to build the container is to run `make`. This will use
`singularity` to build the container `bluse-kernels-container.sif`.

If you are already familiar with building Singlarity containers, the
`bluse-kernels-container.def` file can be used directly with `singularity`:

    singularity build bluse-kernels-container.sif bluse-kernels-container.def

Note that `singularity` requires root priviliges to build containers.

# Using the container to provide Jupyter kernels

To provide the Jupyter kernels of the container to JupyterHub users, simply
follow these steps:

1. Place the `bluse-kernel-containers.sif` file in a location that JupyterHub
   can access.

2. Edit the `kernels/*/kernel.json` files to match your setup:
2.1 Make sure the path to `singularity` is correct
2.2 Make sure to `--bind` any data directories so they will be visible from
the notebooks
2.3 Make sure the path to the `bluse-kernels-container.sif` file is correct

3. Copy the `kernels/*` directory to the JupyterHub kernels directory, being
sure to maintain the directory structure.

Done!

Users with existing JupyterHub servers running will have to restart them to
see the new kernels.

# Other container features

The container has two apps for command line users:

- ipython - runs `ipython` with the container's conda environement activted
- julia - runs `julia` with some preinstalled Julia packages on `LOAD_PATH`

To run these apps, use:

    singularity run --app APP_NAME CONTAINER_NAME [ARGS]
