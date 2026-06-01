extends Node
@export var party:=[1,0,0,0]
@export var charUnlocked=[1,1,1,1,1,1,1,1,1,0]
@export var charXP=[100,200,300,500,1000,0,0,0,0,0]
@export var charLVL=[1,1,1,1,1,1,1,1,1,1]
@export var charHP=[200,175,225,275,320,360,400,600,225,999]


func updateXP()->void:
	for f in range(charXP.size()-1):
		if charXP[f]>=charLVL[f]*100:
			charXP[f]-=(charLVL[f]*100)
			charLVL[f]+=1
