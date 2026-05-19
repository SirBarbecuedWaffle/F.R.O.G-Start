extends AnimatedSprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"."
@onready var timer: Timer = $Timer
var ball=preload("res://moves/cannon_ball.tscn")
var cooldown:=0
@export var damageMulti:=1.0
@onready var guy_1: Node2D = $"../places/guy1"
@onready var cannon_barrage: Node2D = $".."
@onready var end_timer: Timer = $"../endTimer"

func _ready() -> void:
	timer.start(randi_range(2-damageMulti,3-damageMulti))

func _process(delta: float) -> void:
	pass



func _on_timer_timeout() -> void:
	animated_sprite_2d.play("shoot")
	timer.start(randi_range(1,2))
	await get_tree().create_timer(0.4).timeout
	if cannon_barrage.modulate==Color.WHITE:
		var balle=ball.instantiate()
		add_child(balle)
		balle.global_position=guy_1.global_position
	


func _on_animation_finished() -> void:
	animated_sprite_2d.play("default")


func _on_area_2d_area_entered(area: Area2D) -> void:
	if end_timer.time_left<8:
		queue_free()
