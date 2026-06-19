extends Node2D
@onready var arrow_1: damager = $Arrows/arrow1
@export var addStr:=0
@export var addSpd:=0
@export var addDef:=0
@export var addRegen:=0
@export var addInvinc:=0
@export var subStr:=0
@export var subSpd:=0
@export var subDef:=0
@export var addBurn:=0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrow_1.burn+=addBurn
	arrow_1.strBuf+=addStr
	arrow_1.defBuf+=addDef
	arrow_1.spdBuf+=addSpd
	arrow_1.spdRev+=subSpd
	arrow_1.defRev+=subDef
	arrow_1.strRev+=subStr
	arrow_1.regen+=addRegen
	arrow_1.invincible=addInvinc
	await get_tree().create_timer(3.0).timeout
	queue_free()
