extends RigidBody2D
@onready var scanner_icon: Node2D = $scannerIcon
@onready var animated_sprite_2d: AnimatedSprite2D = $scannerIcon/AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $scannerIcon/AnimationPlayer
@onready var box_an: AnimatedSprite2D = $CollisionShape2D/boxAn
var spawnPoint=Vector2(0,0);
@onready var hack_trigger: hackTrigger = $hackTrigger
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2

func _ready() -> void:
	spawnPoint=self.global_position

func _on_area_2d_area_entered(area: Area2D) -> void:
	await get_tree().create_timer(0.4).timeout
	animation_player.play("appear")


func _on_hack_trigger_trig_hack() -> void:
	box_an.play("new_animation")
	scanner_icon.visible=false
	animation_player_2.play_backwards("fadeIn")
	box_an.modulate=Color(3682719498240.0, 3682719498240.0, 3682719498240.0, 1.0)


func _on_hack_trigger_trig_high_light() -> void:
	if animation_player.current_animation!="flash":
		animation_player.play("flash")


func _on_hack_trigger_trig_un_light() -> void:
	animation_player.play("unflash")


func _on_hack_trigger_area_exited(area: Area2D) -> void:
	animation_player.play("RESET")


func _on_box_an_animation_finished() -> void:
	if box_an.animation=="new_animation":
		box_an.modulate=Color(1.0, 1.0, 1.0, 1.0)
		scanner_icon.visible=true
		freeze=true
		animation_player_2.play("fadeIn")
		global_position=spawnPoint
		global_position.y-=10
		rotation=0


func _on_animation_player_2_animation_finished(anim_name: StringName) -> void:
	freeze=false
