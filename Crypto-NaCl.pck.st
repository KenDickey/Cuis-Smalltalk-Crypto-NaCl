'From Cuis 4.2 of 25 July 2013 [latest update: #1788] on 11 August 2013 at 2:35:33.941846 pm'!
'Description Smalltalk interface to the NaCl (salt) crypto library'!
!provides: 'Crypto-NaCl' 1 1!
!requires: 'Cuis-Base' 42 1788 nil!
!requires: 'FFI' 1 nil!
!classDefinition: #NaclError category: #'Crypto-NaCl'!
Error subclass: #NaclError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclError class' category: #'Crypto-NaCl'!
NaclError class
	instanceVariableNames: ''!

!classDefinition: #Nacl category: #'Crypto-NaCl'!
Object subclass: #Nacl
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'Nacl class' category: #'Crypto-NaCl'!
Nacl class
	instanceVariableNames: ''!

!classDefinition: #NaclBoxEnvelope category: #'Crypto-NaCl'!
Object subclass: #NaclBoxEnvelope
	instanceVariableNames: 'nonce ciphertext'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclBoxEnvelope class' category: #'Crypto-NaCl'!
NaclBoxEnvelope class
	instanceVariableNames: ''!

!classDefinition: #NaclBoxPublicKey category: #'Crypto-NaCl'!
Object subclass: #NaclBoxPublicKey
	instanceVariableNames: 'bytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclBoxPublicKey class' category: #'Crypto-NaCl'!
NaclBoxPublicKey class
	instanceVariableNames: ''!

!classDefinition: #NaclBoxSecretKey category: #'Crypto-NaCl'!
Object subclass: #NaclBoxSecretKey
	instanceVariableNames: 'publicKey secretBytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclBoxSecretKey class' category: #'Crypto-NaCl'!
NaclBoxSecretKey class
	instanceVariableNames: ''!

!classDefinition: #NaclBoxVerifyKey category: #'Crypto-NaCl'!
Object subclass: #NaclBoxVerifyKey
	instanceVariableNames: 'bytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclBoxVerifyKey class' category: #'Crypto-NaCl'!
NaclBoxVerifyKey class
	instanceVariableNames: ''!

!classDefinition: #NaclSecretboxKey category: #'Crypto-NaCl'!
Object subclass: #NaclSecretboxKey
	instanceVariableNames: 'keyBytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclSecretboxKey class' category: #'Crypto-NaCl'!
NaclSecretboxKey class
	instanceVariableNames: ''!

!classDefinition: #NaclSigningKey category: #'Crypto-NaCl'!
Object subclass: #NaclSigningKey
	instanceVariableNames: 'verifyKey secretBytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclSigningKey class' category: #'Crypto-NaCl'!
NaclSigningKey class
	instanceVariableNames: ''!

!classDefinition: #NaclTests category: #'Crypto-NaCl'!
TestCase subclass: #NaclTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclTests class' category: #'Crypto-NaCl'!
NaclTests class
	instanceVariableNames: ''!


!ByteArray methodsFor: '*Crypto-Nacl' stamp: 'KenD 8/10/2013 08:13'!
hexEquals: aHexString
	"Answer true if self hex compare the same as aHexString"

	^ (self hex compare: aHexString caseSensitive: false) = 2! !

!String methodsFor: '*Crypto-Nacl' stamp: 'KenD 8/10/2013 08:57'!
equals: otherString
	"Answer true if we compare the same"

	^ (self compare: otherString caseSensitive: true) = 2! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:51'!
apiCryptoBoxCipher: c message: m messageLength: mlen nonce: n pk: pk sk: sk

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:51'!
apiCryptoBoxKeypairPk: pk sk: sk

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:51'!
apiCryptoBoxOpenMessage: m cipher: c cipherLength: mlen nonce: n pk: pk sk: sk

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:51'!
apiCryptoHashSha512Output: outByteArray input: inByteArray inputLength: inByteArrayLength

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:51'!
apiCryptoScalarmultCurve25519BaseTarget: pk source: sk

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:51'!
apiCryptoSecretboxCipher: c message: m messageLength: mlen nonce: n key: key

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:51'!
apiCryptoSecretboxOpenMessage: m cipher: c cipherLength: mlen nonce: n key: key

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:52'!
apiCryptoSignBuffer: b bufferLength: blenPtr message: m length: mlen privateKey: sk 

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:52'!
apiCryptoSignKeypairPk: pk sk: sk

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:52'!
apiCryptoSignKeypairPk: pk sk: sk seed: seed

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:52'!
apiCryptoSignOpenBuffer: b bufferLength: blenPtr signedMessage: sm length: smlen publicKey: pk

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:52'!
apiRandomBytes: aByteArray length: aByteArrayLength

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:06'!
box: message nonce: nonce pk: pk sk: sk

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:16'!
boxBeforeNmBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:17'!
boxBoxZeroBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:07'!
boxKeypair

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:01'!
boxKeypairFromSeed: seed

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:37'!
boxNonce

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:16'!
boxNonceBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:07'!
boxOpen: ciphertext nonce: nonce pk: pk sk: sk

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:16'!
boxPublicKeyBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:16'!
boxSecretKeyBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:16'!
boxZeroBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:06'!
checkError: message apiResult: n

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:09'!
hash: aByteArray

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:14'!
hashBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:03'!
hashString: aString

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:19'!
randomBytes: n

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:09'!
secretbox: message nonce: nonce key: key

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:13'!
secretboxBoxZeroBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:19'!
secretboxKey

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:13'!
secretboxKeyBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:19'!
secretboxNonce

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:12'!
secretboxNonceBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:09'!
secretboxOpen: ciphertext nonce: nonce key: key

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:13'!
secretboxZeroBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:09'!
sign: message privateKey: privateKey

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:45'!
signBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:20'!
signKeypair

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:26'!
signKeypairFromRawSeed: seed

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:27'!
signKeypairFromSeed: bytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:45'!
signPublicKeyBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:45'!
signSecretKeyBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:27'!
signSeedBytes

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:52'!
sodiumVersionMajor

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:52'!
sodiumVersionMinor

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:52'!
sodiumVersionString

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:10'!
verify: signedMessage publicKey: publicKey

!NaclBoxEnvelope methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:07'!
asByteArray

!NaclBoxEnvelope methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:39'!
ciphertext

!NaclBoxEnvelope methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:39'!
ciphertext: anObject

!NaclBoxEnvelope methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:08'!
fromByteArray: bytes

!NaclBoxEnvelope methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:39'!
nonce

!NaclBoxEnvelope methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:39'!
nonce: anObject

!NaclBoxEnvelope class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:08'!
fromByteArray: bytes

!NaclBoxPublicKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:26'!
bytes

!NaclBoxPublicKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:26'!
bytes: anObject

!NaclBoxPublicKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:36'!
pkBytes: pk

!NaclBoxSecretKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:43'!
box: message nonce: nonce publicKey: aPublicKey

!NaclBoxSecretKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:41'!
box: message publicKey: aPublicKey

!NaclBoxSecretKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:53'!
boxOpen: ciphertext nonce: nonce publicKey: aPublicKey

!NaclBoxSecretKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:20'!
boxOpen: envelope publicKey: aPublicKey

!NaclBoxSecretKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:26'!
publicKey

!NaclBoxSecretKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:26'!
publicKey: anObject

!NaclBoxSecretKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:42'!
secretBytes

!NaclBoxSecretKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:43'!
secretBytes: aByteArray

!NaclBoxSecretKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:27'!
fromSeed: seed

!NaclBoxSecretKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:27'!
random

!NaclBoxSecretKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:43'!
skBytes: sk pkBytes: pk

!NaclBoxVerifyKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:34'!
bytes

!NaclBoxVerifyKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:34'!
bytes: anObject

!NaclBoxVerifyKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:59'!
verify: signedMessage

!NaclBoxVerifyKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:33'!
bytes: pk

!NaclSecretboxKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:19'!
box: message

!NaclSecretboxKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:18'!
box: message nonce: nonce

!NaclSecretboxKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:21'!
boxOpen: envelope

!NaclSecretboxKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:20'!
boxOpen: ciphertext nonce: nonce

!NaclSecretboxKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:17'!
keyBytes

!NaclSecretboxKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:17'!
keyBytes: anObject

!NaclSecretboxKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:18'!
keyBytes: aByteArray

!NaclSecretboxKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:19'!
random

!NaclSigningKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:30'!
secretBytes

!NaclSigningKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:30'!
secretBytes: aByteArray

!NaclSigningKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:39'!
sign: aByteArray

!NaclSigningKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:31'!
verifyKey

!NaclSigningKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:31'!
verifyKey: anObject

!NaclSigningKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:32'!
fromSeed: seed

!NaclSigningKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:32'!
random

!NaclSigningKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:33'!
skBytes: sk pkBytes: pk

!NaclTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:46'!
boxKey

!NaclTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:22'!
iotaByteArray: n

!NaclTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:36'!
signKey

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:02'!
testBox

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 08:50'!
testBoxKeypairSeed

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:03'!
testBoxOpen

!NaclTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:11'!
testBoxOpenFail

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 08:15'!
testHash

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:03'!
testSecretbox

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:04'!
testSecretboxOpen

!NaclTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:12'!
testSecretboxOpenFail

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:06'!
testSign

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:05'!
testSignKeypairFromSeed

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:05'!
testVerify

!NaclTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:12'!
testVerifyFail