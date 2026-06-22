extends Node2D
@onready var place_1: Area2D = $places/place1
@onready var place_2: Area2D = $places/place2
@onready var place_3: Area2D = $places/place3
@onready var place_4: Area2D = $places/place4
@onready var places: Node2D = $places
@onready var arrow_1: damager = $Arrows/arrow1
@onready var arrow_2: damager = $Arrows/arrow2
@onready var arrow_3: damager = $Arrows/arrow3
@onready var arrow_4: damager = $Arrows/arrow4
@onready var arrows: Node2D = $Arrows
@export var targets:=[null,null,null]
@onready var spawn_location: Marker2D = $spawnLocation
@export var spawnLoca:=Vector2(0,0)
var healers:=[null,null,null]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_location.global_position=spawnLoca
	await get_tree().create_timer(1.0).timeout
	healers=arrows.get_children()
	for i in range(3):
		if targets[i]!=null:
			healers[i].global_position=targets[i].global_position
		else:
			healers[i]=null
	await get_tree().create_timer(0.1).timeout
	arrow_1.global_position.y+=5000
	arrow_2.global_position.y+=5000
	arrow_3.global_position.y+=5000
	arrow_1.spdBuf=45
	arrow_1.strBuf=45
	arrow_1.defBuf=45
	arrow_2.spdBuf=45
	arrow_2.strBuf=45
	arrow_2.defBuf=45

	arrow_3.spdBuf=45
	arrow_3.strBuf=45
	arrow_3.defBuf=45
	
	await get_tree().create_timer(0.1).timeout
	arrow_1.global_position.y-=5000
	arrow_2.global_position.y-=5000
	arrow_3.global_position.y-=5000
	await get_tree().create_timer(1.0).timeout
	queue_free()
