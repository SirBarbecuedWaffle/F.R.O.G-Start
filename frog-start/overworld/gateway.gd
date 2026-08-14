extends Area2D
@export var levelAtt:=1
var transit:=false
@onready var node_2d: Node2D = $CanvasLayer/Node2D
@onready var color_rect: ColorRect = $CanvasLayer/Node2D/ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if transit:
		var anims=create_tween()
		anims.tween_property(color_rect,"scale",Vector2(1.5,1.5),0.8)
func _on_body_entered(body: Node2D) -> void:
	transit=true
	body.itemPicked=1
	color_rect.visible=true
	await get_tree().create_timer(1.3).timeout
	get_tree().change_scene_to_file("res://overworld/startLevel.tscn")
