extends RigidBody2D
@onready var scanner_icon: Node2D = $scannerIcon
@onready var animated_sprite_2d: AnimatedSprite2D = $scannerIcon/AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $scannerIcon/AnimationPlayer


func _on_area_2d_area_entered(area: Area2D) -> void:
	await get_tree().create_timer(0.4).timeout
	animation_player.play("appear")


func _on_hack_trigger_trig_hack() -> void:
	self.queue_free()


func _on_hack_trigger_trig_high_light() -> void:
	if animation_player.current_animation!="flash":
		animation_player.play("flash")


func _on_hack_trigger_trig_un_light() -> void:
	animation_player.play("unflash")
