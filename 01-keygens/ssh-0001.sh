#!/bin/sh

# This creates a private and public key pair using SSH-Keygen.

# Example usage:  ./ssh-0001.sh mykeys

mkdir 00_$1
cd 00_$1

# Please uncomment one of the lines listed below:
#ssh-keygen -f 00_key_$1 -t rsa -b 2048 -C "test@foobar.com"
#ssh-keygen -f 00_key_$1 -t dsa -b 2048 -C "test@foobar.com"
#ssh-keygen -f 00_key_$1 -t ecdsa -b 256 -C "test@foobar.com"

ssh-keygen -e -f 00_key_$1 > 00_public_key_$1.asc

cd ../

