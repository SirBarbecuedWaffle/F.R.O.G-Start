extends Node2D
@onready var label: Label = $Label
@export var damageAmount:=0
@export var damageType:=""
@onready var node_2d: Node2D = $"."
var realDmage:=0
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
	
func _process(delta: float) -> void:
	label.text=str(abs(damageAmount))
	if damageAmount<0:
		node_2d.modulate=Color.GREEN
	if damageAmount==0:
		node_2d.modulate=Color(1.0, 0.831, 0.0, 1.0)
	if damageType=="poison":
		node_2d.modulate=Color.DARK_GREEN
	if damageType=="fire":
		node_2d.modulate=Color.ORANGE
	if damageType=="cleaving":
		node_2d.modulate=Color.RED
	if damageType=="glitch":
		node_2d.modulate=Color.PURPLE
		realDmage=damageAmount
		label.text=str(randi_range(0,realDmage))
	
