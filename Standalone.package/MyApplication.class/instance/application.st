accessing
application
	<script: 'self new application open setLabel: ''4 gradient corners'''>
	| extent half linear color label roassal clock location |
	canvas := RSCanvas new.
	extent := 800 @ 600.
	half := extent / 2.
	linear := [ :val :a :b | 
	(LinearGradientPaint fromArray: val)
		start: a * half;
		stop: b * half ].
	color := NSScale ordinal range:
		{(linear value: {0 -> '7D66E9'. 1 -> 'E664AC'} value: -1 @ 1 value: 1 @ -1).
		(linear value: {0 -> '71C1E2'. 0.9 -> Color transparent} value: -1 @ -1 value: 0 @ 1).
		(linear value: {0 -> 'EDB259'. 0.9 -> Color transparent} value: 1 @ 1 value: 0 @ -1)}.

	canvas addAll: ((1 to: 3) collect: [:i | 
		RSBox new
			draggable;
			extent: extent;
			color: (color scale: i);
			yourself
		]).
	label := [:t | RSLabel new
		fontSize: 40;
		color: Color white;
		text: t;
		yourself 
	].
	roassal := label value: 'Roassal3 2019'.
	clock := label value: Time now print24.
	clock fontSize: 100.
	canvas add: roassal.
	canvas add: clock.
	canvas newAnimation
		duration: 500 milliSeconds;
		repeat;
		when: RSAnimationLoopEvent do: [ clock text: Time now print24 ].
	location := RSLocation new
		inner;
		bottom;
		offset: 0 @ -15.
	location move: roassal on: canvas nodes.
	canvas
		addShape: (RSBitmap new form: PolymorphSystemSettings pharoLogoForm).
	location
		top;
		offset: 0 @ 15.
	location move: canvas shapes last on: canvas nodes.
	canvas @ RSCanvasController.
	^ canvas