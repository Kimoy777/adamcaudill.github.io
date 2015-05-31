---
layout: page
title: "CurveLock"
date: 2015-05-31 19:43
comments: true
sharing: true
footer: true
---

CurveLock is an experimental high-security message and file encryption application for Windows. To enhance security, the application was designed around the following key design points:

* Desktop based, to reduce attack surface (unlike other options that are web/browser based)
* Minimal exposed metadata
* Non-NIST asymmetric encryption ([curve25519](https://en.wikipedia.org/wiki/Curve25519))
* Crypto operations performed via [libsodium](https://github.com/jedisct1/libsodium)
* Aggressive scrypt settings to resist bruteforcing passwords

![](https://github.com/adamcaudill/CurveLock/raw/master/resources/screenshot.png)

## Text Message Format

The message is formatted as follows:

    <version_byte> || <nonce, 24 bytes> || <sender’s public key, 32 bytes> || 
      BLAKE2B(nonce || recipient’s public key) || <encrypted message>

* Version: 1 byte, used to indicate the message format. Current version is `0x00`
* Nonce: 24 bytes, randomly generated nonce used to encrypt message
* Sender’s Public Key: 32 bytes, required to decrypt message (ephemeral, see below)
* Recipient Verifier: 16 bytes, recipient’s public key hashed with the nonce using Blake2b
* Encrypted Message: message length + 16 bytes; the curve25519/XSalsa20/Poly1305 ([crypto_box](http://nacl.cr.yp.to/box.html)) encrypted message

**Anonymity:** To protect information about who sent a message, the sender uses an ephemeral key that is discarded after the message is sent. This prevents tracking who is sending messages, and prevents the sender from being able to later decrypt the message. To protect the recipient, especially in the case that the recipient has multiple public keys (“identities”), the recipient’s public key is hashed with the nonce, producing a 16 byte hash. This allows the recipient to confirm that they are using the proper private key, without exposing information that could be used for tracking.

The downside of this is that it isn’t possible to authenticate who sent a message, if this type of authentication is required, another method of authentication should be used.

## File Format

Files are encrypted via [StreamCryptor](https://github.com/bitbeans/StreamCryptor), into `SCCEF` format. The same anonymity measures that exist for Text Message are employed here as well; so files are encrypted with an ephemeral key pair. As with Text Messages, StreamCryptor uses `libsodium` for all cryptographic operations.

StreamCryptor is a small library that sits on top of `libsodium-net` (and thus `libsodium`) to perform chunked file encryption.

## Identity

A CurveLock Identity is derived from the user’s password and email address using [scrypt](https://www.tarsnap.com/scrypt.html), the public ID is the user’s public key encoded with [Base58Check](https://en.bitcoin.it/wiki/Base58Check_encoding). To generate the seed for the private key, the `scrypt` is used with the user’s password, and the user’s email as the salt (hashed with Blake2b); the `scrypt` parameters are:

    OPS_LIMIT = 8388608
    MEM_LIMIT = 100000000

These setting use 100MB of RAM, and takes roughly 5 seconds to complete. While this is likely excessive for most users, this greatly complicates attempts to brute force the password.

The first byte if the ID is a version indicator; the current version is `0x0A`.

Overall, the identity design was inspired by [miniLock](https://github.com/kaepora/miniLock/blob/master/README.md#2-key-derivation), though is more aggressive to improve security.

[See GitHub For More](https://github.com/adamcaudill/CurveLock) | [Downloads](https://github.com/adamcaudill/CurveLock/releases)