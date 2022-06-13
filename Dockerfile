ARG RUST_VER=1.61

from rust:${RUST_VER}-slim

RUN apt update && apt install -y \
		python3 \
		python3-pip \
	  g++ \
	  libssl-dev \
	  pkg-config \
	  cmake && rm -rf /var/lib/apt/lists/*

RUN pip3 install jupyterlab

#jupyter labextension install @jupyterlab/hub-extension
#jupyter lab build

COPY init.evcxr /root/.config/evxcr/init.evcxr

RUN cargo install evcxr_jupyter sccache && evcxr_jupyter --install && rm -rf /usr/local/cargo/registry

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888"]
CMD ["--notebook-dir=/notebooks", "--allow-root", "--no-browser","--NotebookApp.token=''","--NotebookApp.password=''","--NotebookApp.disable_check_xsrf=True"]

