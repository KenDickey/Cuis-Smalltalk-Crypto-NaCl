Cuis-NaCl
==========
Tested with Cuis 4.2 revision 2972; libsodium 1.0.2 on Intel and ARM processors

### Cuis interface to NaCl (pronounced "salt") cryptographic library

Ported to Cuis from the Squeak/Pharo code originally by Tony Garnock-Jones
  http://www.eighty-twenty.org/index.cgi/tech/smalltalk/nacl-for-squeak-and-pharo-20130601.html


### Installation

Get and install the NaCl (salt) code
  https://github.com/jedisct1/libsodium

Load the package in Cuis 4.2

````Smalltalk
	Feature require: 'Crypto-NaCl'.  "Note NaCl has $N and $C capitalized"
````

Note simple end-to-end usage example: NaclTests>>TestExampleHighLevel

If zero unit tests pass, be sure to place the libsodium library file (libsodium.so on Linux) in your image directory (probably Cuis-Smalltalk-Dev).

### Further documentation available at

  http://nacl.cr.yp.to
