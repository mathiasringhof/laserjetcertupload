# LaserJet Cert Upload
BASH script to take a PEM cert+key, generate a compatible PKCS#12 and upload to a HP LaserJet

Successfully tested on:
- HP Color LaserJet M255dw

## Details
Created to automate LetsEncrypt certificate upload to my LaserJet printer, based on [Peter Hicks Blog Entry](https://blog.poggs.com/2017/04/27/printer-security-securing-an-hp-laserjet-printer-with-letsencrypt/).

For the printer to accept the certificate the script just uses the first block from the generated file, otherwise the upload would fail for me - YMMV.

I'm using [cert-manager](https://cert-manager.io/docs/) in Kubernetes but I assume certbot or others would create the exact same output.
