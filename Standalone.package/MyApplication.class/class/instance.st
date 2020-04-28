system startup
instance
	^ instance ifNil: [ instance := self new ]