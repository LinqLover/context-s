accessing
selector: anObject
	"Set the value of selector"

	anObject = #'' ifTrue: [ "empty selectors are set from         basicAddSelector:withMethod:"
		^ self].
	selector := anObject