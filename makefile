.PHONY: build
build:
	docker build -t gotele .

.PHONY: build
run: build
	docker run --rm -it -p 443:443 --name teleport \
	-v teleport-config:/etc/teleport -v teleport-data:/var/lib/teleport -v teleport-certs:/certs \
	gotele --config /etc/teleport/teleport.yaml

.PHONY: tele
tele:
	docker run --rm -it -p 443:443 --name teleport-distroless \
	-v teleport-config:/etc/teleport -v teleport-data:/var/lib/teleport -v teleport-certs:/certs \
	public.ecr.aws/gravitational/teleport-distroless-debug:15.3.1 --config /etc/teleport/teleport.yaml