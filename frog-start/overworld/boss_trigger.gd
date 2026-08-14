extends Area2D
@export var bossNum:=1
@onready var boss_1: AnimatedSprite2D = $boss1
signal startBoss(bossN :int)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if bossNum==1:
		if PManager.beatBoss1==true:
			queue_free()
		else:
			boss_1.visible=true


func _on_area_entered(area: Area2D) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	startBoss.emit(bossNum)
