#!/bin/sh

# This creates a private and public key pair using Botan.

# Example usage:  ./botan-0002.sh mykeys

mkdir 00_$1
cd 00_$1

botan keygen --algo=RSA --params=3072 --provider=Keygens > 00_private_$1.pem

botan pkcs8 --pub-out 00_private_$1.pem > 00_public_$1.key

botan gen_pkcs10 00_private_$1.pem CN --country=GB --organization=Keygens --email=test@foobar.com > 00_csr_$1.csr

botan gen_self_signed 00_private_$1.pem CN --country=GB --organization=Keygens --email=test@foobar.com --days=3652 > 00_crt_$1.crt

cd ../

