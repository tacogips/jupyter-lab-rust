## Usage
### docker run

```bash
docker run --mount src="$(pwd)",target=/notebooks,type=bind -p 8888:8888 tacogips/jupyter-lab-rust:latest
```

open `localohst:8888` without token.

### docker-compose example

```yaml
# docker-compose.yml
version: "3.9"

services:
  jupyter:
    image: tacogips/jupyter-lab-rust:latest
    volumes:
      - ./vol:/notebooks
    ports:
      - 8888:8888
```


## The default command
```Dockerfile
ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888"]
CMD ["--notebook-dir=/notebooks", "--allow-root", "--no-browser","--NotebookApp.token=''","--NotebookApp.password=''","--NotebookApp.disable_check_xsrf=True"]
```

