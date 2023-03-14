'From Cuis 6.0 [latest update: #5677] on 14 March 2023 at 11:16:54 am'!
'Description Smalltalk interface to the NaCl (salt) crypto library'!
!provides: 'Crypto-NaCl' 1 7!
!requires: 'Cuis-Base' 60 5677 nil!
!requires: 'FFI' 1 36 nil!
SystemOrganization addCategory: 'Crypto-NaCl'!


!classDefinition: #NaclError category: 'Crypto-NaCl'!
Error subclass: #NaclError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclError class' category: 'Crypto-NaCl'!
NaclError class
	instanceVariableNames: ''!

!classDefinition: #NaclTests category: 'Crypto-NaCl'!
TestCase subclass: #NaclTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclTests class' category: 'Crypto-NaCl'!
NaclTests class
	instanceVariableNames: ''!

!classDefinition: #Nacl category: 'Crypto-NaCl'!
Object subclass: #Nacl
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'Nacl class' category: 'Crypto-NaCl'!
Nacl class
	instanceVariableNames: ''!

!classDefinition: #NaclBoxEnvelope category: 'Crypto-NaCl'!
Object subclass: #NaclBoxEnvelope
	instanceVariableNames: 'nonce ciphertext'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclBoxEnvelope class' category: 'Crypto-NaCl'!
NaclBoxEnvelope class
	instanceVariableNames: ''!

!classDefinition: #NaclBoxPublicKey category: 'Crypto-NaCl'!
Object subclass: #NaclBoxPublicKey
	instanceVariableNames: 'bytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclBoxPublicKey class' category: 'Crypto-NaCl'!
NaclBoxPublicKey class
	instanceVariableNames: ''!

!classDefinition: #NaclBoxSecretKey category: 'Crypto-NaCl'!
Object subclass: #NaclBoxSecretKey
	instanceVariableNames: 'publicKey secretBytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclBoxSecretKey class' category: 'Crypto-NaCl'!
NaclBoxSecretKey class
	instanceVariableNames: ''!

!classDefinition: #NaclBoxVerifyKey category: 'Crypto-NaCl'!
Object subclass: #NaclBoxVerifyKey
	instanceVariableNames: 'bytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclBoxVerifyKey class' category: 'Crypto-NaCl'!
NaclBoxVerifyKey class
	instanceVariableNames: ''!

!classDefinition: #NaclSecretboxKey category: 'Crypto-NaCl'!
Object subclass: #NaclSecretboxKey
	instanceVariableNames: 'keyBytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclSecretboxKey class' category: 'Crypto-NaCl'!
NaclSecretboxKey class
	instanceVariableNames: ''!

!classDefinition: #NaclSigningKey category: 'Crypto-NaCl'!
Object subclass: #NaclSigningKey
	instanceVariableNames: 'verifyKey secretBytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Crypto-NaCl'!
!classDefinition: 'NaclSigningKey class' category: 'Crypto-NaCl'!
NaclSigningKey class
	instanceVariableNames: ''!


!Nacl commentStamp: '<historical>' prior: 0!
I am the interface to libsodium, the NaCl (salt) crypto library.

See https://github.com/jedisct1/libsodium
!

!NaclTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:46'!
boxKey
	^ NaclBoxSecretKey
		skBytes: (ByteArray readHexFrom: 'd54ff4b666a43070ab20937a92c49ecf65503583f8942350fc197c5023b015c3')
		pkBytes: (ByteArray readHexFrom: 'de1042928b74e9f96cf3f3e290c16cb4eba9c696e9a1e15c7f4d0514ddce1154')
! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:22'!
iotaByteArray: n
	| result |
	result := ByteArray new: n.
	1 to: n do: [:i | result at: i put: i - 1].
	^ result! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:36'!
signKey
	^ NaclSigningKey
		skBytes: (ByteArray readHexFrom: '105cece5569cda0b3e1a06dcf3d95c7559b1c942d5f8fe0270377500172d306dcfdfa9d055a2f69b8828d7aca7bae0256d735c8f9a8db28f920ddc269a86aaec')
		pkBytes: (ByteArray readHexFrom: 'cfdfa9d055a2f69b8828d7aca7bae0256d735c8f9a8db28f920ddc269a86aaec')! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:02'!
testBox
	| n e |
	n := ByteArray readHexFrom: '065114ca5a687e0544a88e6fc757b30afc70a0355854fd54'.
	e := self boxKey box: 'hello' asByteArray nonce: n publicKey: self boxKey publicKey.
	self assert: (e ciphertext hexEquals: '3bc95b7983622e8afb763723703e17c6739be9c316').! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 08:50'!
testBoxKeypairSeed
	| kp |
	kp := Nacl boxKeypairFromSeed: (ByteArray new: 0).
	self assert: (kp publicKey bytes hexEquals: '20d2d5a2cdd64d78eeb5437b33d1cb848204f5f3a4665eb5e55e6623387a8667').
	self assert: (kp secretBytes hexEquals: 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce').
! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 3/14/2023 11:15:20'!
testBoxOpen
	| n m |
	n := ByteArray readHexFrom: '065114ca5a687e0544a88e6fc757b30afc70a0355854fd54'.
	m := self boxKey
			boxOpen: (ByteArray readHexFrom: '3bc95b7983622e8afb763723703e17c6739be9c316')
			nonce: n publicKey: self boxKey publicKey.
	self assert: ( String  compare:  m asString with: 'hello' ) = 2.! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:11'!
testBoxOpenFail
	| n |
	n := ByteArray readHexFrom: '065114ca5a687e0544a88e6fc757b30afc70a0355854fd54'.
	self should: [
		self boxKey
			boxOpen: (ByteArray readHexFrom: '3bc95b7983622e8afb763723703e17c6739be9c317') "note final digit!!"
			nonce: n publicKey: self boxKey publicKey]
		raise: NaclError.! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 08:15'!
testHash
	self assert: ((Nacl hash: (ByteArray new: 0)) hexEquals: 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e').
	self assert: ((Nacl hashString: 'The quick brown fox jumps over the lazy dog') hexEquals: '07e547d9586f6a73f73fbac0435ed76951218fb7d0c8d788a309d785436bbb642e93a252a954f23912547d1e8a3b5ed6e1bfd7097821233fa0538f3db854fee6').
	self assert: ((Nacl hashString: 'The quick brown fox jumps over the lazy dog.') hexEquals: '91ea1245f20d46ae9a037a989f54f1f790f0a47607eeb8a14d12890cea77a1bbc6c7ed9cf205e67b7f2b8fd4c7dfd3a7a8617e45f3c463d481c7e586c39ac1ed').! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 2/23/2015 15:42'!
testNaclHighLevelAPI
	"Test showing a simple example start to end, using the highlevel API"

	| aliceSeed bobSeed envelope aKeys bKeys plainText |
	aliceSeed := '.A man, a plan, a canal, Panama.'.
	bobSeed := 'Cuis is the best thing on wheels'.
	
	aKeys := NaclBoxSecretKey fromSeed: aliceSeed asByteArray.
	bKeys := NaclBoxSecretKey fromSeed: bobSeed asByteArray.

	plainText := 'Quando in le Curso del Eventos human, il deveni necessari
pro un Populo dissolver le Bandas Politic que les ha con 
nectite con un altere, e assumer inter le Poteres del Terra, le
Position separate e equal al qual le Leges del Natura e del
Deo de Natura les da titulo, un decente Respecto al Opinio-
nes del Humanitate require que illes declara le causas que les
impelle al Separation.'.
	
	"Alice encrypts using her private key and Bob's public key"
	envelope := aKeys box: plainText asByteArray publicKey: bKeys publicKey.

	"Bob decrypts using Alice's public key ahd his private key"
	self assert:
		(bKeys boxOpen: envelope publicKey: aKeys publicKey) asString = plainText.! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 2/23/2015 15:42'!
testNaclLowLevelAPI
	"Test showing a simple example start to end, using the lowlevel API"

	| aliceSeed bobSeed nonce aKeys bKeys plainText box |
	aliceSeed := '.A man, a plan, a canal, Panama.'.
	bobSeed := 'Cuis is the best thing on wheels'.
	
	aKeys := Nacl boxKeypairFromSeed: aliceSeed asByteArray.
	bKeys := Nacl boxKeypairFromSeed: bobSeed asByteArray.

	plainText := 'Quando in le Curso del Eventos human, il deveni necessari
pro un Populo dissolver le Bandas Politic que les ha con 
nectite con un altere, e assumer inter le Poteres del Terra, le
Position separate e equal al qual le Leges del Natura e del
Deo de Natura les da titulo, un decente Respecto al Opinio-
nes del Humanitate require que illes declara le causas que les
impelle al Separation.'.
	
	nonce := Nacl boxNonce.
	
	"Alice encrypts using her private key and Bob's public key"
	box := Nacl box: plainText asByteArray  nonce: nonce pk: bKeys  publicKey bytes sk: aKeys secretBytes.

	"Bob decrypts using Alice's public key ahd his private key"
	self assert: (
		(Nacl boxOpen: box nonce: nonce pk: aKeys publicKey bytes sk: bKeys secretBytes) asString
		= plainText
	).! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:03'!
testSecretbox
	| k e |
	k := NaclSecretboxKey keyBytes: (self iotaByteArray: Nacl secretboxKeyBytes).
	e := k box: 'Meet in the old churchyard at midnight.' asByteArray nonce: (self iotaByteArray: Nacl secretboxNonceBytes).
	self assert: (e ciphertext hexEquals: '01440c4518408578f1348926e058e82b139a5d3be7a3cc30cf54ea1e07e32eb731cd33adef4d468e65c647f521e7cc88e7b59cb22dc4db').! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:04'!
testSecretboxOpen
	| k m |
	k := NaclSecretboxKey keyBytes: (self iotaByteArray: Nacl secretboxKeyBytes).
	m := k
			boxOpen: (ByteArray readHexFrom: '01440c4518408578f1348926e058e82b139a5d3be7a3cc30cf54ea1e07e32eb731cd33adef4d468e65c647f521e7cc88e7b59cb22dc4db')
			nonce: (self iotaByteArray: Nacl secretboxNonceBytes).
	self assert: m asString equals: 'Meet in the old churchyard at midnight.'.! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:12'!
testSecretboxOpenFail
	| k |
	k := NaclSecretboxKey keyBytes: (self iotaByteArray: Nacl secretboxKeyBytes).
	self should: [
		k
			boxOpen: (ByteArray readHexFrom: '01440c4518408578f1348926e058e82b139a5d3be7a3cc30cf54ea1e07e32eb731cd33adef4d468e65c647f521e7cc88e7b59cb22dc4dc') "note final digit!!"
			nonce: (self iotaByteArray: Nacl secretboxNonceBytes)]
		raise: NaclError.! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:06'!
testSign
	self assert: ((self signKey sign: 'Hello, world' asByteArray) hexEquals: '3c1d5b10d8feef927e7633501a53e8ddc5dc4439055acea3b96cf23b5c941540d50721dbae65cde0fadaefd26d924e25b3d59116240119df18f96366e0a7760c48656c6c6f2c20776f726c64')! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:05'!
testSignKeypairFromSeed
	| k sm |
	k := Nacl signKeypairFromSeed: 'This is my passphrase' asByteArray.
	sm := ByteArray readHexFrom: 'dd13136c30516f8d6a679129e1b21cecd0d6c21e050f13a48468641565a3458e5390d83a301f9b5ba238097a7b4439663c7f5fb34684e09801d25bd08439a70248656c6c6f2c20776f726c64'.
	self assert: (k sign: 'Hello, world' asByteArray) equals: sm.
	self assert: (k verifyKey verify: sm) asString equals: 'Hello, world'.! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:05'!
testVerify
	| m |
	m := self signKey verifyKey verify: (ByteArray readHexFrom: '3c1d5b10d8feef927e7633501a53e8ddc5dc4439055acea3b96cf23b5c941540d50721dbae65cde0fadaefd26d924e25b3d59116240119df18f96366e0a7760c48656c6c6f2c20776f726c64').
	self assert: m asString equals: 'Hello, world'.! !

!NaclTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:12'!
testVerifyFail
	self should: [
		self signKey verifyKey verify: (ByteArray readHexFrom: '3c1d5b10d8feef927e7633501a53e8ddc5dc4439055acea3b96cf23b5c941540d50721dbae65cde0fadaefd26d924e25b3d59116240119df18f96366e0a7760c48656c6c6f2c20776f726c65'). "note final digit!!"]
		raise: NaclError.! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 1/26/2015 17:22'!
apiCryptoBoxCipher: c message: m messageLength: mlen nonce: n pk: pk sk: sk
	<apicall: long 'crypto_box_curve25519xsalsa20poly1305' (byte* byte* ulonglong byte* byte* byte*) module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 1/26/2015 17:29'!
apiCryptoBoxKeypairPk: pk sk: sk
	<apicall: long 'crypto_box_curve25519xsalsa20poly1305_keypair' (byte* byte*) module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 1/26/2015 17:25'!
apiCryptoBoxOpenMessage: m cipher: c cipherLength: mlen nonce: n pk: pk sk: sk
	<apicall: long 'crypto_box_curve25519xsalsa20poly1305_open' (byte* byte* ulonglong byte* byte* byte*) module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 1/26/2015 17:23'!
apiCryptoHashSha512Output: outByteArray input: inByteArray inputLength: inByteArrayLength
	<apicall: long 'crypto_hash_sha512' (byte* byte* ulonglong) module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 1/26/2015 17:24'!
apiCryptoScalarmultCurve25519BaseTarget: pk source: sk
	<apicall: long 'crypto_scalarmult_curve25519_base' (byte* byte*) module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 1/26/2015 17:25'!
apiCryptoSecretboxCipher: c message: m messageLength: mlen nonce: n key: key
	<apicall: long 'crypto_secretbox_xsalsa20poly1305' (byte* byte* ulonglong byte* byte*) module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 1/26/2015 17:26'!
apiCryptoSecretboxOpenMessage: m cipher: c cipherLength: mlen nonce: n key: key
	<apicall: long 'crypto_secretbox_xsalsa20poly1305_open' (byte* byte* ulonglong byte* byte*) module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 1/26/2015 17:26'!
apiCryptoSignBuffer: b bufferLength: blenPtr message: m length: mlen privateKey: sk 
	<apicall: long 'crypto_sign_ed25519' (byte* byte* byte* ulonglong byte*) module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:52'!
apiCryptoSignKeypairPk: pk sk: sk
	<apicall: long 'crypto_sign_ed25519_ref_keypair' (byte* byte*) module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 1/26/2015 17:27'!
apiCryptoSignKeypairPk: pk sk: sk seed: seed
	<apicall: long 'crypto_sign_ed25519_seed_keypair' (byte* byte* byte*) module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 1/26/2015 17:28'!
apiCryptoSignOpenBuffer: b bufferLength: blenPtr signedMessage: sm length: smlen publicKey: pk
	<apicall: long 'crypto_sign_ed25519_open' (byte* byte* byte* ulonglong byte*) module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 20:52'!
apiRandomBytes: aByteArray length: aByteArrayLength
	<apicall: void 'randombytes' (byte* ulonglong) module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:06'!
box: message nonce: nonce pk: pk sk: sk
	| c m |
	m := (ByteArray new: self boxZeroBytes), message.
	c := ByteArray new: m size.
	self checkError: 'crypto_box failed' apiResult: (self apiCryptoBoxCipher: c message: m messageLength: m size nonce: nonce pk: pk sk: sk).
	^ c copyFrom: self boxBoxZeroBytes + 1 to: c size! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:16'!
boxBeforeNmBytes
	^ 32! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:17'!
boxBoxZeroBytes
	^ 16! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:07'!
boxKeypair
	| pk sk |
	sk := ByteArray new: self boxSecretKeyBytes.
	pk := ByteArray new: self boxPublicKeyBytes.
	self checkError: 'crypto_box_keypair failed' apiResult: (self apiCryptoBoxKeypairPk: pk sk: sk).
	^ NaclBoxSecretKey skBytes: sk pkBytes: pk! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:01'!
boxKeypairFromSeed: seed
	| sk pk |
	sk := (Nacl hash: seed) copyFrom: 1 to: Nacl boxSecretKeyBytes.
	pk := ByteArray new: Nacl boxPublicKeyBytes.
	self apiCryptoScalarmultCurve25519BaseTarget: pk source: sk.
	^ NaclBoxSecretKey skBytes: sk pkBytes: pk! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:37'!
boxNonce
	^ self randomBytes: self boxNonceBytes! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:16'!
boxNonceBytes
	^ 24! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:07'!
boxOpen: ciphertext nonce: nonce pk: pk sk: sk
	| c m |
	c := (ByteArray new: self boxBoxZeroBytes), ciphertext.
	m := ByteArray new: c size.
	self checkError: 'crypto_box_open failed' apiResult: (self apiCryptoBoxOpenMessage: m cipher: c cipherLength: c size nonce: nonce pk: pk sk: sk).
	^ m copyFrom: self boxZeroBytes + 1 to: m size! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:16'!
boxPublicKeyBytes
	^ 32! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:16'!
boxSecretKeyBytes
	^ 32! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:16'!
boxZeroBytes
	^ 32! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:06'!
checkError: message apiResult: n
	n isZero ifFalse: [NaclError signal: message]! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:09'!
hash: aByteArray
	| result |
	result := ByteArray new: self hashBytes.
	self checkError: 'crypto_hash failed' apiResult: (self apiCryptoHashSha512Output: result input: aByteArray inputLength: aByteArray size).
	^ result! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:14'!
hashBytes
	^ 64! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 8/10/2013 09:03'!
hashString: aString
	^ self hash: aString asByteArray! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:19'!
randomBytes: n
	| result |
	result := ByteArray new: n.
	self apiRandomBytes: result length: result size.
	^ result! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:09'!
secretbox: message nonce: nonce key: key
	| c m |
	m := (ByteArray new: self secretboxZeroBytes), message.
	c := ByteArray new: m size.
	self checkError: 'crypto_secretbox failed' apiResult: (self apiCryptoSecretboxCipher: c message: m messageLength: m size nonce: nonce key: key).
	^ c copyFrom: self secretboxBoxZeroBytes + 1 to: c size! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:13'!
secretboxBoxZeroBytes
	^ 16! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:19'!
secretboxKey
	^ NaclSecretboxKey keyBytes: (self randomBytes: self secretboxKeyBytes)! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:13'!
secretboxKeyBytes
	^ 32! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:19'!
secretboxNonce
	^ self randomBytes: self secretboxNonceBytes! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:12'!
secretboxNonceBytes
	^ 24! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:09'!
secretboxOpen: ciphertext nonce: nonce key: key
	| c m |
	c := (ByteArray new: self secretboxBoxZeroBytes), ciphertext.
	m := ByteArray new: c size.
	self checkError: 'crypto_secretbox_open failed' apiResult: (self apiCryptoSecretboxOpenMessage: m cipher: c cipherLength: c size nonce: nonce key: key).
	^ m copyFrom: self secretboxZeroBytes + 1 to: m size! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:13'!
secretboxZeroBytes
	^ 32! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:09'!
sign: message privateKey: privateKey
	| sm smlenBuf smlen |
	sm := ByteArray new: message size + self signBytes.
	smlenBuf := ByteArray new: 8.
	self checkError: 'crypto_sign failed' apiResult: (self apiCryptoSignBuffer: sm bufferLength: smlenBuf message: message length: message size privateKey: privateKey).
	smlen := ((smlenBuf longAt: 5 bigEndian: Smalltalk isBigEndian) bitShift: 32) + (smlenBuf longAt: 1 bigEndian: Smalltalk isBigEndian).
	^ sm copyFrom: 1 to: smlen! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:45'!
signBytes
	^ 64! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:20'!
signKeypair
	| pk sk |
	sk := ByteArray new: self signSecretKeyBytes.
	pk := ByteArray new: self signPublicKeyBytes.
	self checkError: 'crypto_sign_keypair failed' apiResult: (self apiCryptoSignKeypairPk: pk sk: sk).
	^ NaclSigningKey skBytes: sk pkBytes: pk! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:26'!
signKeypairFromRawSeed: seed
	| pk sk |
	(seed size ~= self signSeedBytes) ifTrue: [
		self error: 'Seed for signing keypair must be ', self signSeedBytes asString,' bytes long.'].
	sk := ByteArray new: self signSecretKeyBytes.
	pk := ByteArray new: self signPublicKeyBytes.
	self checkError: 'crypto_sign_seed_keypair failed' apiResult: (self apiCryptoSignKeypairPk: pk sk: sk seed: seed).
	^ NaclSigningKey skBytes: sk pkBytes: pk! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:27'!
signKeypairFromSeed: bytes
	^ self signKeypairFromRawSeed: ((self hash: bytes) copyFrom: 1 to: self signSeedBytes)! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:45'!
signPublicKeyBytes
	^ 32! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:45'!
signSecretKeyBytes
	^ 64! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:27'!
signSeedBytes
	^ self signSecretKeyBytes // 2! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 2/23/2015 15:40'!
sodiumVersionMajor
"
	Nacl sodiumVersionMajor.
"
	<apicall: long 'sodium_library_version_major' () module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 2/23/2015 15:40'!
sodiumVersionMinor
"
	Nacl sodiumVersionMinor.
"
	<apicall: long 'sodium_library_version_minor' () module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'KenD 2/23/2015 15:41'!
sodiumVersionString
"
	Nacl  sodiumVersionString.
"
	<apicall: char* 'sodium_version_string' () module: 'libsodium'>
	^self externalCallFailed! !

!Nacl class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:10'!
verify: signedMessage publicKey: publicKey
	| m mlenBuf mlen |
	m := ByteArray new: signedMessage size.
	mlenBuf := ByteArray new: 8.
	self checkError: 'crypto_sign_open failed' apiResult: (self apiCryptoSignOpenBuffer: m bufferLength: mlenBuf signedMessage: signedMessage length: signedMessage size publicKey: publicKey).
	mlen := ((mlenBuf longAt: 5 bigEndian: Smalltalk isBigEndian) bitShift: 32) + (mlenBuf longAt: 1 bigEndian: Smalltalk isBigEndian).
	^ m copyFrom: 1 to: mlen! !

!NaclBoxEnvelope methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:07'!
asByteArray
	^ nonce, ciphertext! !

!NaclBoxEnvelope methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:08'!
fromByteArray: bytes
	nonce := bytes copyFrom: 1 to: Nacl boxNonceBytes.
	ciphertext := bytes copyFrom: Nacl boxNonceBytes + 1 to: bytes size.! !

!NaclBoxEnvelope methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:39'!
ciphertext
	
	^ ciphertext! !

!NaclBoxEnvelope methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:39'!
ciphertext: anObject
	
	ciphertext := anObject! !

!NaclBoxEnvelope methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:39'!
nonce
	
	^ nonce! !

!NaclBoxEnvelope methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:39'!
nonce: anObject
	
	nonce := anObject! !

!NaclBoxEnvelope class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:08'!
fromByteArray: bytes
	^ self new fromByteArray: bytes! !

!NaclBoxPublicKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:26'!
bytes
	
	^ bytes! !

!NaclBoxPublicKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:26'!
bytes: anObject
	
	bytes := anObject! !

!NaclBoxPublicKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:36'!
pkBytes: pk
	| result |
	result := self new.
	result bytes: pk.
	^ result! !

!NaclBoxSecretKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:43'!
box: message nonce: nonce publicKey: aPublicKey
	| e |
	e := NaclBoxEnvelope new.
	e nonce: nonce.
	e ciphertext: (Nacl box: message nonce: nonce pk: aPublicKey bytes sk: self secretBytes).
	^ e! !

!NaclBoxSecretKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:41'!
box: message publicKey: aPublicKey
	^ self box: message nonce: Nacl boxNonce publicKey: aPublicKey! !

!NaclBoxSecretKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:53'!
boxOpen: ciphertext nonce: nonce publicKey: aPublicKey
	^ Nacl boxOpen: ciphertext nonce: nonce pk: aPublicKey bytes sk: self secretBytes! !

!NaclBoxSecretKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:20'!
boxOpen: envelope publicKey: aPublicKey
	^ self boxOpen: envelope ciphertext nonce: envelope nonce publicKey: aPublicKey! !

!NaclBoxSecretKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:26'!
publicKey
	
	^ publicKey! !

!NaclBoxSecretKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:26'!
publicKey: anObject
	
	publicKey := anObject! !

!NaclBoxSecretKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:42'!
secretBytes
	^ secretBytes! !

!NaclBoxSecretKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 16:43'!
secretBytes: aByteArray
	secretBytes := aByteArray! !

!NaclBoxSecretKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:27'!
fromSeed: seed
	^ Nacl boxKeypairFromSeed: seed! !

!NaclBoxSecretKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:27'!
random
	^ Nacl boxKeypair! !

!NaclBoxSecretKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 16:43'!
skBytes: sk pkBytes: pk
	| result |
	result := self new.
	result secretBytes: sk.
	result publicKey: (NaclBoxPublicKey pkBytes: pk).
	^ result! !

!NaclBoxVerifyKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:34'!
bytes
	
	^ bytes! !

!NaclBoxVerifyKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:34'!
bytes: anObject
	
	bytes := anObject! !

!NaclBoxVerifyKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:59'!
verify: signedMessage
	^ Nacl verify: signedMessage publicKey: self bytes! !

!NaclBoxVerifyKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:33'!
bytes: pk
	| result |
	result := self new.
	result bytes: pk.
	^ result! !

!NaclSecretboxKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:19'!
box: message
	^ self box: message nonce: Nacl secretboxNonce! !

!NaclSecretboxKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:18'!
box: message nonce: nonce
	| e |
	e := NaclBoxEnvelope new.
	e nonce: nonce.
	e ciphertext: (Nacl secretbox: message nonce: nonce key: self keyBytes).
	^ e! !

!NaclSecretboxKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:21'!
boxOpen: envelope
	^ self boxOpen: envelope ciphertext nonce: envelope nonce! !

!NaclSecretboxKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:20'!
boxOpen: ciphertext nonce: nonce
	^ Nacl secretboxOpen: ciphertext nonce: nonce key: self keyBytes! !

!NaclSecretboxKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:17'!
keyBytes
	
	^ keyBytes! !

!NaclSecretboxKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:17'!
keyBytes: anObject
	
	keyBytes := anObject! !

!NaclSecretboxKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:18'!
keyBytes: aByteArray
	^ self new keyBytes: aByteArray! !

!NaclSecretboxKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 18:19'!
random
	^ Nacl secretboxKey! !

!NaclSigningKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:30'!
secretBytes
	^ secretBytes! !

!NaclSigningKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:30'!
secretBytes: aByteArray
	secretBytes := aByteArray! !

!NaclSigningKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:31'!
verifyKey
	
	^ verifyKey! !

!NaclSigningKey methodsFor: 'accessing' stamp: 'tonyg 6/1/2013 17:31'!
verifyKey: anObject
	
	verifyKey := anObject! !

!NaclSigningKey methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:39'!
sign: aByteArray
	^ Nacl sign: aByteArray privateKey: self secretBytes! !

!NaclSigningKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:32'!
fromSeed: seed
	^ Nacl signKeypairFromSeed: seed! !

!NaclSigningKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:32'!
random
	^ Nacl signKeypair! !

!NaclSigningKey class methodsFor: 'as yet unclassified' stamp: 'tonyg 6/1/2013 17:33'!
skBytes: sk pkBytes: pk
	| result |
	result := self new.
	result secretBytes: sk.
	result verifyKey: (NaclBoxVerifyKey bytes: pk).
	^ result! !

!String methodsFor: '*Crypto-Nacl' stamp: 'KenD 8/10/2013 08:57'!
equals: otherString
	"Answer true if we compare the same"

	^ (self compare: otherString caseSensitive: true) = 2! !

!ByteArray methodsFor: '*Crypto-Nacl' stamp: 'KenD 3/14/2023 11:12:52'!
hexEquals: aHexString
	"Answer true if self hex compare the same as aHexString"

	^ (String compareIgnoreCase: self hex with: aHexString) = 2! !
