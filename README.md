# odoh-deploy

How to run an Oblivious DNS over HTTPS proxy or target

## Deploy

Edit file `inventory` to specify where to install.
Then run the build and provisioning scripts using

    make install
    
To first test this on a VM using Vagrant, run

    make install-local

## Test

To test using a command-line ODoH client:

```
$ make test
odoh-client-go/odoh-client odoh --domain surf.nl. --dnstype AAAA --target odoh.cloudflare-dns.com --proxy odoh1.surfdomeinen.nl
;; opcode: QUERY, status: NOERROR, id: 8341
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;surf.nl.	IN	 AAAA

;; ANSWER SECTION:
surf.nl.	196	IN	AAAA	2001:610:508:108:192:87:108:15
surf.nl.	196	IN	AAAA	2001:610:188:410:145:100:190:243
```

## See also

- [Cloudflare blog](https://blog.cloudflare.com/oblivious-dns/) on Oblivious DNS over HTTPS (ODoH)
- [SURF blog](https://communities.surf.nl/artikel/privacy-en-het-domain-name-system-1) on a pilot with ODoH (in Dutch)
- [ODoH proxy/target](https://github.com/chris-wood/odoh-server)
-	command-line [ODoH client](https://github.com/cloudflare/odoh-client-go)
