extends Sprite2D
@onready var timer: Timer = $Timer
var speed:=1800
func _process(delta: float) -> void:
	speed*=1.01
	global_position.x-=speed*delta
	if global_position.x<-200:
		queue_free()


func _on_timer_timeout() -> void:
	modulate=Color(255,randf_range(0.3,1),randf_range(0.3,1))
	timer.start()
