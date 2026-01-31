extends Node2D
@export var spawnLoca:Vector2
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


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_location.global_position=spawnLoca
	arrow_1.global_position=place_1.global_position
	arrow_1.global_position.y=place_1.global_position.y-150
	arrow_2.global_position=place_2.global_position
	arrow_2.global_position.y=place_2.global_position.y-150
	arrow_3.global_position=place_3.global_position
	arrow_3.global_position.y=place_3.global_position.y-150
	arrow_4.global_position=place_4.global_position
	arrow_4.global_position.y=place_4.global_position.y-150
	await get_tree().create_timer(1.6).timeout
	for a in arrows.get_children():
		if a.visible:
			a.audio_bus_override=true
	await get_tree().create_timer(3.0).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for a in arrows.get_children():
		if a.audio_bus_override:
			a.global_position.y+=15


func _on_place_1_area_entered(area: Area2D) -> void:
	arrow_1.visible=true


func _on_place_2_area_entered(area: Area2D) -> void:
	arrow_2.visible=true


func _on_place_3_area_entered(area: Area2D) -> void:
	arrow_3.visible=true


func _on_place_4_area_entered(area: Area2D) -> void:
	arrow_4.visible=true
