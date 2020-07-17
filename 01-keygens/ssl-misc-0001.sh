#!/bin/sh

# This creates a private and public key pair using OpenSSL, and makes a self signed
# X-509 Certificate.

# Example usage:  ./ssl-misc-0001.sh mykeys

mkdir 00_$1
cd 00_$1

# Please uncomment one of the lines listed below:
#openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out 00_private_$1.pem
#openssl genpkey -algorithm DSA -genparam -pkeyopt dsa_paramgen_bits:2048 -out 00_private_$1.pem
#openssl genpkey -algorithm EC -pkeyopt ec_paramgen_curve:secp256k1 -pkeyopt ec_param_enc:named_curve -out 00_private_$1.pem

openssl pkey -in 00_private_$1.pem -pubout -out 00_public_$1.pem

openssl req -new -key 00_private_$1.pem -out 00_csr_$1.csr
openssl x509 -req -in 00_csr_$1.csr -signkey 00_private_$1.pem -days 3652 -out 00_crt_$1.crt

openssl req -in 00_csr_$1.csr -text -out 00_csr_$1.txt
openssl x509 -in 00_crt_$1.crt -text -out 00_crt_$1.txt

cd ../

