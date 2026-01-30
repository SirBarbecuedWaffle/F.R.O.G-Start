extends Node2D
@export var spawnLoca:Vector2
@onready var spawn_location: Marker2D = $spawnLocation
@onready var place_1: Area2D = $places/place1
@onready var place_2: Area2D = $places/place2
@onready var place_3: Area2D = $places/place3
@onready var place_4: Area2D = $places/place4


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_location.global_position=spawnLoca


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_place_1_area_entered(area: Area2D) -> void:
	place_1.monitoring=false
	place_1.monitorable=false


func _on_place_2_area_entered(area: Area2D) -> void:
	place_2.monitoring=false
	place_2.monitorable=false


func _on_place_3_area_entered(area: Area2D) -> void:
	place_3.monitoring=false
	place_3.monitorable=false


func _on_place_4_area_entered(area: Area2D) -> void:
	place_4.monitoring=false
	place_4.monitorable=false
