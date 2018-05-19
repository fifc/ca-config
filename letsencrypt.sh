cd /root/certbot
openssl ecparam -genkey -name secp384r1 -noout -out ec.key
# openssl ec -in ec.key -pubout -out pub.key
openssl req -new -sha384 -key ec.key -out ec-der.csr -outform der -config openssl.cnf
./certbot-auto certonly --manual  --register-unsafely-without-email --preferred-challenges dns --csr ec-der.csr

cat<<EOF
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /root/certbot/0001_chain.pem
   Your cert will expire on 2018-04-14. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot-auto
   again. To non-interactively renew *all* of your certificates, run
   "certbot-auto renew"
EOF
