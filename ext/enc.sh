#!/usr/bin/env bash
java -cp enc.isc uy.isaportal.iscert.signmodule.ISCertEncrypter
cp -f plane/p7signature.yml config/p7signature.yml
