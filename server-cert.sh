# https://devcentral.f5.com/articles/building-an-openssl-certificate-authority/building-an-openssl-certificate-authority-creating-ecc-certificates-27912
openssl ecparam -genkey -name secp384r1 -out intermediate/private/server.key.pem
openssl req -config intermediate/openssl_server.cfg -new -key intermediate/private/server.key.pem -out intermediate/csr/server.csr
openssl ca -config intermediate/openssl_server.cfg -extensions server_cert -days 730 -in intermediate/csr/server.csr -out intermediate/certs/server.crt.pem
openssl x509 -noout -text -in intermediate/certs/server.crt.pem
openssl pkcs12 -export -out intermediate/certs/server.pfx -inkey intermediate/private/server.key.pem -in intermediate/certs/server.crt.pem -certfile intermediate/certs/chain.crt.pem

