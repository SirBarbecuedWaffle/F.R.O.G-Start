extends Area2D
@export var damage:=1.5
@export var oneHit:=false
@export var knockback:=false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_area_entered(area: Area2D) -> void:
	if oneHit:
		animation_player.play("collect")
		await get_tree().create_timer(0.4).timeout
		queue_free()


func _on_animated_sprite_2d_animation_finished() -> void:
	collision_shape_2d.disabled=false
	animation_player.play("hover")
