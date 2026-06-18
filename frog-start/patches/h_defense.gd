extends Node2D
@onready var arrow_1: damager = $Arrows/arrow1
@export var addStr:=0
@export var addSpd:=0
@export var addDef:=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrow_1.strBuf+=addStr
	arrow_1.defBuf+=addDef
	arrow_1.spdBuf+=addSpd
	await get_tree().create_timer(3.0).timeout
	queue_free()
