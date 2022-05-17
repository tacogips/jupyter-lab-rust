build-image:
	docker build -f Dockerfile -t tacogips/jupyter-lab-rust:latest .

publish:
	docker push tacogips/jupyter-lab-rust:latest
