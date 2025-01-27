executing
valueWithReceiver: aReceiver arguments: anArray
	"Memorize old method-chain, compute a new one, kick off the execution and restore the old state afterwards."
	
	| oldProcessState methodChain |
	methodChain := self methodChainFor: self activeLayers.
	methodChain size == 0 ifTrue: ["Not a single method to execute..."
		^ aReceiver doesNotUnderstand: (Message selector: self selector arguments: anArray) ].
	oldProcessState := Processor activeProcess csInfo saveState.
	Processor activeProcess csInfo methodChain: methodChain.
	^ [ methodChain first valueWithReceiver: aReceiver arguments: anArray ]
		ensure: [
			Processor activeProcess csInfo restoreStateFrom: oldProcessState ]