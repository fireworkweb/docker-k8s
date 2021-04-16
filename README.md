### fireworkweb/k8s

# ATTENTION - THIS REPO MOVED TO [kool-dev/docker-toolkit](https://github.com/kool-dev/docker-toolkit)

> `fwd` is dead, long live [`kool` (check it out now!)](https://github.com/kool-dev/kool)

This repository is deprecated and archived in favour of Kool maintened DevOps toolbox: https://github.com/kool-dev/docker-toolkit

Below you will find original `fireworkweb/k8s` README for the sake of historic value.

---

Docker image with [Kubernetes](https://kubernetes.io/)-related tools.

Available packages:

- kubectl
- helm
- aws-cli
- do-ctl

## Usage

You can use it running the package you need directly:

```bash
# kubectl
docker run --rm -it fireworkweb/k8s kubectl version --client

# helm
docker run --rm -it fireworkweb/k8s helm version

# aws
docker run --rm -it fireworkweb/k8s aws --version

# doctl
docker run --rm -it fireworkweb/k8s doctl version
```

You can also use some specific tag version. Check [the available tags](https://github.com/fireworkweb/docker-k8s/releases).

```bash
docker run --rm -it fireworkweb/k8s:1.0.0 kubectl version --client
```

## License

[MIT](LICENSE.md)
