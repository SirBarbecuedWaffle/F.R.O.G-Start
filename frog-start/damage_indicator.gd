extends Node2D
@onready var label: Label = $Label
@export var damageAmount:=0
@export var damageType:=""
@onready var node_2d: Node2D = $"."

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
	
func _process(delta: float) -> void:
	label.text=str(abs(damageAmount))
	if damageAmount<1:
		node_2d.modulate=Color.GREEN
	if damageType=="poison":
		node_2d.modulate=Color.DARK_GREEN
	if damageType=="fire":
		node_2d.modulate=Color.ORANGE
	if damageType=="cleaving":
		node_2d.modulate=Color.RED
	
	
