extends RigidBody2D
@onready var scanner_icon: Node2D = $scannerIcon
@onready var animated_sprite_2d: AnimatedSprite2D = $scannerIcon/AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $scannerIcon/AnimationPlayer


func _on_area_2d_area_entered(area: Area2D) -> void:
	await get_tree().create_timer(0.4).timeout
	animation_player.play("appear")
