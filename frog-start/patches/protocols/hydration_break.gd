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
@export var bone:=0
@onready var cof_1: Sprite2D = $Arrows/arrow1/cof1
@onready var inv_1: Sprite2D = $Arrows/arrow1/inv1
@onready var def_1: Sprite2D = $Arrows/arrow1/def1
@onready var str_1: Sprite2D = $Arrows/arrow1/str1
@onready var reg_1: Sprite2D = $Arrows/arrow1/reg1
@onready var cof_2: Sprite2D = $Arrows/arrow2/cof2
@onready var inv_2: Sprite2D = $Arrows/arrow2/inv2
@onready var def_2: Sprite2D = $Arrows/arrow2/def2
@onready var str_2: Sprite2D = $Arrows/arrow2/str2
@onready var reg_2: Sprite2D = $Arrows/arrow2/reg2
@onready var cof_3: Sprite2D = $Arrows/arrow3/cof3
@onready var inv_3: Sprite2D = $Arrows/arrow3/inv3
@onready var def_3: Sprite2D = $Arrows/arrow3/def3
@onready var str_3: Sprite2D = $Arrows/arrow3/str3
@onready var reg_3: Sprite2D = $Arrows/arrow3/reg3
@onready var cof_4: Sprite2D = $Arrows/arrow4/cof4
@onready var inv_4: Sprite2D = $Arrows/arrow4/inv4
@onready var def_4: Sprite2D = $Arrows/arrow4/def4
@onready var str_4: Sprite2D = $Arrows/arrow4/str4
@onready var reg_4: Sprite2D = $Arrows/arrow4/reg4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var type=randi_range(1,3)
	if bone==1:
		type=randi_range(1,5)
	if bone==2:
		arrow_1.damage+=25
		arrow_2.damage+=25
		arrow_3.damage+=25
		arrow_4.damage+=25
	if type==1:
		arrow_1.spdBuf=10
		arrow_2.spdBuf=10
		arrow_3.spdBuf=10
		arrow_4.spdBuf=10
		cof_1.visible=true
		cof_2.visible=true
		cof_3.visible=true
		cof_4.visible=true
	
	if type==2:
		arrow_1.strBuf=10
		arrow_2.strBuf=10
		arrow_3.strBuf=10
		arrow_4.strBuf=10
		str_1.visible=true
		str_2.visible=true
		str_3.visible=true
		str_4.visible=true
	
	if type==3:
		arrow_1.defBuf=10
		arrow_2.defBuf=10
		arrow_3.defBuf=10
		arrow_4.defBuf=10
		def_1.visible=true
		def_2.visible=true
		def_3.visible=true
		def_4.visible=true
	
	if type==4:
		arrow_1.regen=50
		arrow_2.regen=50
		arrow_3.regen=50
		arrow_4.regen=50
		reg_1.visible=true
		reg_2.visible=true
		reg_3.visible=true
		reg_4.visible=true
	
	if type==5:
		arrow_1.invincible=5
		arrow_2.invincible=5
		arrow_3.invincible=5
		arrow_4.invincible=5
		inv_1.visible=true
		inv_2.visible=true
		inv_3.visible=true
		inv_4.visible=true
	
	spawn_location.global_position=spawnLoca
	arrow_1.global_position=place_1.global_position
	arrow_1.global_position.y=place_1.global_position.y-170
	arrow_2.global_position=place_2.global_position
	arrow_2.global_position.y=place_2.global_position.y-170
	arrow_3.global_position=place_3.global_position
	arrow_3.global_position.y=place_3.global_position.y-170
	arrow_4.global_position=place_4.global_position
	arrow_4.global_position.y=place_4.global_position.y-170
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


func _on_arrow_1_area_entered(area: Area2D) -> void:
	arrow_1.queue_free()


func _on_arrow_2_area_entered(area: Area2D) -> void:
	arrow_2.queue_free()



func _on_arrow_3_area_entered(area: Area2D) -> void:
	arrow_3.queue_free()



func _on_arrow_4_area_entered(area: Area2D) -> void:
	arrow_4.queue_free()
