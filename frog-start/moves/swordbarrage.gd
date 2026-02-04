extends Node2D
@onready var timer: Timer = $Timer

var swordCount:=50
var sword=preload("res://moves/sword.tscn")
var lastY:=0.0

func _on_timer_timeout() -> void:
	swordCount-=1
	if swordCount>0:
		var newSwo=sword.instantiate()
		timer.start()
		newSwo.global_position.y=randi_range(1,10)*85
		while lastY==newSwo.global_position.y:
			newSwo.global_position.y=randi_range(1,10)*85
		lastY=newSwo.global_position.y
		add_child(newSwo)
	else:
		await get_tree().create_timer(5.0).timeout
		queue_free()
