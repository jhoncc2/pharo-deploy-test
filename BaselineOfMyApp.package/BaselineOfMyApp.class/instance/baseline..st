baselines
baseline: spec 
	<baseline>
	spec for: #common do: [
		spec 
			baseline: 'Roassal3' with: [spec repository: 'github://ObjectProfile/Roassal3'].
			spec
				package: #'Standalone' with: [ spec requires: #('Roassal3') ].
		].