extends Node
@export var party:=[1,0,0,	0]
@export var charUnlocked=[1,1,1,1,1,1,1,1,1,1]
@export var charXP=[0,0,0,0,0,0,0,0,0,0]
@export var charLVL=[1,1,1,1,1,1,1,1,1,1]
@export var charHP=[200,175,225,275,320,360,400,600,225,999]
@export var levelUpDisplays=[0,0,0,0]
@export var fauxParty=[0,0,0,0]
#@export var patchesUnlocked=[0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]
@export var patchesUnlocked=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
@export var currentPatches=[0,0,0,0]

func updateXP()->void:
	for i in range(4):
		fauxParty[i]=party[i]	
	for f in range(charXP.size()-1):
		while charXP[f]>=charLVL[f]*100:
			charXP[f]-=(charLVL[f]*100)
			if charLVL[f]<20:
				charLVL[f]+=1
				for i in range(4):
					if fauxParty[i]==f+1:
						levelUpDisplays[i]+=1

func _process(delta: float) -> void:
	pass
