extends Node2D

var allowance:=0
var aliveEnemies:=0
var curEnems=[0,0,0,0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	allowance=randi_range(2,5)
	while abs(allowance/3)>1:
		var curEnem=randi_range(2,3)
		allowance-=curEnem
	while allowance>0:
		allowance-=1
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
