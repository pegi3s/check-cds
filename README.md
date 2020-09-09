# CheckCDS [![license](https://img.shields.io/badge/license-MIT-brightgreen)](https://github.com/pegi3s/check-cds) [![dockerhub](https://img.shields.io/badge/hub-docker-blue)](https://hub.docker.com/r/pegi3s/check-cds) [![compihub](https://img.shields.io/badge/hub-compi-blue)](https://www.sing-group.org/compihub/explore/5f588ccb407682001ad3a1d5)
> **CheckCDS** is a [compi](https://www.sing-group.org/compi/) pipeline to produce valid CDS files. A Docker image is available for this pipeline in [this Docker Hub repository](https://hub.docker.com/r/pegi3s/check-cds).

## CheckCDS repositories

- [GitHub](https://github.com/pegi3s/check-cds)
- [DockerHub](https://hub.docker.com/r/pegi3s/check-cds)
- [CompiHub](https://www.sing-group.org/compihub/explore/5f588ccb407682001ad3a1d5)

# Using the CheckCDS image in Linux
In order to use the CheckCDS image, you should run and adapt the following command:

```bash
docker run --rm -v /path/to/input:/input -v /path/to/output:/output pegi3s/check-cds -- -r <reference_sequence>
```

Where you should replace:
- `/path/to/input` to point to the directory that contains the input file you want to process.
- `/path/to/output` to point to the directory where the output files must be created.
- `<reference_sequence>` to the string that must be found in the reference sequence.

By default, a maximum of 6 parallel tasks can be run. To modify this value, use the `--num-tasks` parameter as the following example shows (replacing `<num_tasks>` with the new value):

```bash
docker run --rm -v /path/to/input:/input -v /path/to/output:/output pegi3s/check-cds --num-tasks <num_tasks> -- -r <reference_sequence>
```

# Test data
The sample data is available [here](https://github.com/pegi3s/check-cds/tree/master/resources/test-data/small). Download the FASTA files and put them inside a directory named `check_cds_test_data` in your local file system.

Then, you should adapt and run the following command:

```bash
docker run --rm -v /path/to/check_cds_test_data:/input -v /path/to/output:/output pegi3s/check-cds -- -r seq4
```

## Building the Docker image

To build the Docker image, [`compi-dk`](https://www.sing-group.org/compi/#downloads) is required. Once you have it installed, simply run `compi-dk build` from the project directory to build the Docker image. The image will be created with the name specified in the `compi.project` file (i.e. `pegi3s/check-cds:latest`). This file also specifies the version of compi that goes into the Docker image.
