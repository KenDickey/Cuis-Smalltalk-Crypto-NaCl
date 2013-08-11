Cuis-NaCl
==========

### Cuis interface to NaCl (pronounced "salt") cryptographic library

Ported to Cuis from the Squeak/Pharo code originally by Tony Garnock-Jones 
  http://www.eighty-twenty.org/index.cgi/tech/smalltalk/nacl-for-squeak-and-pharo-20130601.html


### Installation

Get and install the NaCl (salt) code
  https://github.com/jedisct1/libsodium

Load the package in Cuis 4.2

````Smalltalk
	"Temporary bug workaround
	 -- Open a FileList and load ByteArray-readHexFrom.st
	    then either load Crypto-NaCl.pck.st or .."

	Feature require: 'Crypto-NaCl'.  "Note NaCl has $N and $C capitalized"
````

### Further documentation available at

  http://nacl.cr.yp.to
