Cuis-Ropes
==========

### Cuis interface to NaCl (salt) crypto library

Ported from the Squeak/Pharo code by Tony Garnock-Jones 
  http://www.eighty-twenty.org/index.cgi/tech/smalltalk/nacl-for-squeak-and-pharo-20130601.html


### Installation

Get and install the NaCl (salt) code from its creators
  http://nacl.cr.yp.to

Load the package in Cuis 4.2

````Smalltalk
	"Temporary bug workaround
	 -- Open a FileList and load ByteArray-readHexFrom.st
	    then either load Crypto-NaCl.pck.st or .."

	Feature require: 'Crypto-NaCl'.  "Note NaCl has $N and $C capitalized"
````