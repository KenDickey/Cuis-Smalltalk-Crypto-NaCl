'From Cuis 4.2 of 25 July 2013 [latest update: #1788] on 10 August 2013 at 3:56:24.60055402 pm'!

!ByteArray methodsFor: 'initialize' stamp: 'KenD 8/10/2013 09:01'!
readHexFrom: aStream
	"Initialize the receiver from a hexadecimal string representation"
	| map v ch value |
	map := '0123456789abcdef'.
	1 to: self size do: [ :i |
		ch := aStream next asLowercase.
		v := (map indexOf: ch) - 1.
		 (v between: 0 and: 15) ifFalse: [ ^self error: 'Hex digit expected' ].
		value := v bitShift: 4.
		ch := aStream next.
		v := (map indexOf: ch) - 1.
		(v between: 0 and: 15) ifFalse: [ ^self error: 'Hex digit expected' ].
		value := value + v.
		self at: i put: value.
	]! !
