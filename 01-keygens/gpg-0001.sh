#!/bin/sh

# This creates a private and public key pair using GnuPG.

# Example usage:  ./gpg-0001.sh mykeys test@foobar.com

mkdir 00_$1
cd 00_$1

gpg --expert --full-gen-key

gpg --armor --export-secret-key $2 > 00_private_$1.asc
gpg --armor --export $2 > 00_public_$1.asc

gpg --list-public-keys > 01_pubkey_$1.txt
gpg --list-secret-keys > 01_privkey_$1.txt
gpg --fingerprint > 01_fingerprint_$1.txt

cd ../

