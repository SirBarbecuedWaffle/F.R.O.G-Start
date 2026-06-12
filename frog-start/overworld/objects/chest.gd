extends Node2D
var canOpen:=0
@onready var open: Sprite2D = $open
@export var patchHeld:=0
@export var itemType:="patch"
var playbody : CharacterBody2D = null
func _ready() -> void:
	if CManager.patchesUnlocked[patchHeld-1]==1:
		open.visible=true

func _input(event):
	if Input.is_action_just_pressed("space"):
		if CManager.patchesUnlocked[canOpen-1]==0 && canOpen==patchHeld:
			playbody.itemCollect(patchHeld)
			open.visible=true
			canOpen=false
			CManager.patchesUnlocked[patchHeld-1]=1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if open.visible==false:
		canOpen=patchHeld
		playbody=body


func _on_area_2d_body_exited(body: Node2D) -> void:
	canOpen=0
