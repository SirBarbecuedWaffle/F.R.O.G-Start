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
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var fireball: AnimatedSprite2D = $Arrows/arrow4/fireball
@onready var explosion: AnimatedSprite2D = $explosion

@onready var burn_effect: damager = $burnEffect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	for i in places.get_children():
		if i.audio_bus_override:
			var targNew:=Marker2D.new()
			targNew.global_position=i.global_position
			targets.add_child(targNew)
	await get_tree().create_timer(0.6).timeout
	if targets.get_children().size()!=0:
		var specTarg=targets.get_children()[randi_range(0,targets.get_children().size()-1)]
		var tween = create_tween()
		tween.tween_property(arrow_4,"global_position",specTarg.global_position,1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	await get_tree().create_timer(7.0).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_place_1_area_entered(area: Area2D) -> void:
	place_1.audio_bus_override=true


func _on_place_2_area_entered(area: Area2D) -> void:
	place_2.audio_bus_override=true


func _on_place_3_area_entered(area: Area2D) -> void:
	place_3.audio_bus_override=true


func _on_place_4_area_entered(area: Area2D) -> void:
	place_4.audio_bus_override=true


func _on_arrow_4_area_entered(area: Area2D) -> void:
	fireball.visible=false
	explosion.visible=true
	explosion.play("default")
	burn_effect.global_position=fireball.global_position
	explosion.global_position=fireball.global_position+Vector2(-100,150)
	arrow_4.queue_free()
	await get_tree().create_timer(3.0).timeout
	queue_free()
