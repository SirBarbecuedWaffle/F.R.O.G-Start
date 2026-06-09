extends Node2D
@onready var label: Label = $Label
@export var damageAmount:=0
@export var char:=""
@onready var node_2d: Node2D = $"."
@onready var color_picker: AnimationPlayer = $colorPicker
var realDmage:=0
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
	
func _process(delta: float) -> void:
	if char=="frog":
		color_picker.play("frog")
	if char=="steve":
		color_picker.play("steve")
	if char=="mask":
		color_picker.play("mask")
	if char=="hood":
		color_picker.play("hood")
	if char=="robot":
		color_picker.play("robot")
	if char=="joe":
		color_picker.play("joe")
	if char=="fox":
		color_picker.play("fox")
	if char=="lizard":
		color_picker.play("lizard")
	if char=="barrel":
		color_picker.play("barrel")
	
