openssl ecparam  -out intermediate/private/gboot.cc.key.pem -name secp384r1 -genkey
chmod 400 intermediate/private/gboot.cc.key.pem
# add subject alternative names to intermediate/openssl.cfg
openssl req -config intermediate/openssl.cnf -key  intermediate/private/gboot.cc.key.pem -new -sha256 -out intermediate/csr/gboot.cc.csr.pem
openssl ca -config intermediate/openssl.cnf -extensions server_cert -days 375 -notext -md sha256 -in intermediate/csr/gboot.cc.csr.pem -out intermediate/certs/gboot.cc.cert.pem
chmod  444 intermediate/certs/gboot.cc.cert.pem
openssl x509 -noout -text -in intermediate/certs/gboot.cc.cert.pem


