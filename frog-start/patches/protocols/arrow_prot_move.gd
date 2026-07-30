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
@onready var arrows: Node2D = $Arrows
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var multiplier:=1.0
@onready var yellow_arrow: Sprite2D = $Arrows/arrow1/yellowArrow
@onready var green_arrow: Sprite2D = $Arrows/arrow1/greenArrow
@onready var red_arrow: Sprite2D = $Arrows/arrow1/redArrow
@onready var blue_arrow: Sprite2D = $Arrows/arrow1/blueArrow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_location.global_position=spawnLoca
	arrow_1.global_position=spawn_location.global_position
	arrow_1.global_position.x=spawn_location.global_position.x-50
	var type=randi_range(0,3)
	if type==0:
		yellow_arrow.visible=true
	if type==1:
		arrow_1.damage=5
		arrow_1.spdRev=3
		green_arrow.visible=true
	if type==2:
		arrow_1.damage=5
		arrow_1.strRev=3
		red_arrow.visible=true
	if type==3:
		arrow_1.damage=5
		arrow_1.defRev=3
		blue_arrow.visible=true

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
		tween.tween_property(arrow_1,"global_position",specTarg.global_position,1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
		await get_tree().create_timer(1.1).timeout
		animation_player.play("arrowFade")
		await get_tree().create_timer(0.3).timeout
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if arrows.get_children().size()==0:
		queue_free()


func _on_place_1_area_entered(area: Area2D) -> void:
	place_1.audio_bus_override=true


func _on_place_2_area_entered(area: Area2D) -> void:
	place_2.audio_bus_override=true


func _on_place_3_area_entered(area: Area2D) -> void:
	place_3.audio_bus_override=true


func _on_place_4_area_entered(area: Area2D) -> void:
	place_4.audio_bus_override=true
