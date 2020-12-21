# build odoh client and server

# server

odoh-server:
	git clone https://github.com/chris-wood/odoh-server

# cross compile for linux:
odoh-server/odoh-server: odoh-server
	cd odoh-server && GOOS="linux" GOARCH="amd64" go build

ansible/files/odoh-server/odoh-server: odoh-server/odoh-server
	cp odoh-server/odoh-server ansible/files/odoh-server/

install-local: ansible/files/odoh-server/odoh-server
	vagrant up --provision

install: ansible/files/odoh-server/odoh-server
	ansible-playbook -i inventory ansible/playbook.yml

# client

odoh-client-go:
	git clone https://github.com/cloudflare/odoh-client-go

odoh-client-go/odoh-client: odoh-client-go
	cd odoh-client-go && make

test: odoh-client-go/odoh-client
	odoh-client-go/odoh-client odoh --domain surf.nl. --dnstype AAAA --target odoh.cloudflare-dns.com --proxy odoh1.surfdomeinen.nl

# clean up
clean:
	-rm -rf odoh-server odoh-client-go ansible/files/odoh-server/odoh-server
	vagrant destroy
