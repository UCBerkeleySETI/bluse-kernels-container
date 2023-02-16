NAME = bluse-kernels-container

default: sif

sandbox:
	sudo singularity build $(BUILD_OPTS) --no-cleanup --sandbox $(NAME).sandbox $(NAME).def

sif:
	sudo singularity build $(BUILD_OPTS) $(NAME).sif $(NAME).def

clean:
	sudo rm -rf $(NAME).sif $(NAME).sandbox

.PHONY: default sandbox sif clean
