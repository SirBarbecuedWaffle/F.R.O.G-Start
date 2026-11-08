extends Area2D

var spawnLoca=Vector2.ZERO
var fallen=false
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	spawnLoca=global_position
	


func _on_icicletrigger_body_entered(body: Node2D) -> void:
	if !fallen:
		fallen=true
		animation_player.play("fall")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name=="fall":
		animation_player.play("fadeIn")
	if anim_name=="fadeIn":
		fallen=false
	
