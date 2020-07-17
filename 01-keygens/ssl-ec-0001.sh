#!/bin/sh

# This creates a private and public key pair using OpenSSL with ECDSA Encryption, and makes
# a self signed X-509 Certificate.

# Example usage:  ./ssl-ec-0001.sh mykeys secp256k1

mkdir 00_$1
cd 00_$1

openssl ecparam -out 00_ecparam_$1.pem -name $2
openssl ecparam -genkey -out 00_private_$1.pem -name $2

openssl ec -in 00_private_$1.pem -outform PEM -pubout -out 00_public_$1.pem

openssl req -new -key 00_private_$1.pem -out 00_csr_$1.csr
openssl x509 -req -in 00_csr_$1.csr -signkey 00_private_$1.pem -days 3652 -out 00_crt_$1.crt

openssl req -in 00_csr_$1.csr -text -out 00_csr_$1.txt
openssl x509 -in 00_crt_$1.crt -text -out 00_crt_$1.txt

cd ../

