extends Node2D
@onready var spawn_location: Marker2D = $spawnLocation
@onready var place_1: Area2D = $places/place1
@onready var place_2: Area2D = $places/place2
@onready var place_3: Area2D = $places/place3
@onready var place_4: Area2D = $places/place4
@onready var places: Node2D = $places
@onready var targets: Node2D = $targets
@onready var arrow_1: damager = $Arrows/arrow1
@onready var arrow_2: damager = $Arrows/arrow2
@onready var arrow_3: damager = $Arrows/arrow3
@onready var arrow_4: damager = $Arrows/arrow4
@onready var arrows: Node2D = $Arrows
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var place:=Vector2(0,0)
@onready var strike_projectile: damager = $strikeProjectile
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_location.global_position=place
	await get_tree().create_timer(1.0).timeout
	strike_projectile.global_position=spawn_location.global_position
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name=="animate":
		queue_free()
