extends Node2D


@onready var bomb: Node2D = $bomb
var bubbleCount:=40
@onready var strike_projectile_2: damager = $strikeProjectile2

var bubbleInst:=preload("res://moves/bubble.tscn")

func spawnBubble()->void:
	if bubbleCount>0:
		var bubble=bubbleInst.instantiate()
		bomb.add_child(bubble)
		bubbleCount-=1
		await get_tree().create_timer(0.15).timeout
		spawnBubble()
		if bubbleCount==20:
			strike_projectile_2.global_position.y-=2000
	else:
		await get_tree().create_timer(3.0).timeout
		queue_free()

func _ready() -> void:
	spawnBubble()
