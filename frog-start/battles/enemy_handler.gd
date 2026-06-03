extends Node2D

var aliveEnemies:=0
var curEnems=[0,0,0,0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var allowance=7
	print(allowance)
	while allowance/3.0>1:
		var curEnem=randi_range(2,3)
		allowance-=curEnem
		for i in range(4):
			if curEnems[i]==0:
				curEnems[i]=curEnem
				break
	while allowance>0:
		allowance-=1
		for i in range(4):
			if curEnems[i]==0:
				curEnems[i]=1
				break
	print(curEnems)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
