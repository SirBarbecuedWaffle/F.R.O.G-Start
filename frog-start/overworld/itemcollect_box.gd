extends Node2D
@onready var label: Label = $Label
var white=false
var colors=[Color(1.0, 0.18, 0.18, 1.0),Color(1.0, 0.867, 0.0, 1.0),Color(0.0, 1.0, 0.083, 1.0),Color(0.0, 1.0, 0.95, 1.0),Color(0.0, 0.467, 1.0, 1.0),Color(1.0, 0.38, 0.659, 1.0),Color(1.0, 0.735, 0.47, 1.0)]

func _on_timer_timeout() -> void:
	if white:
		label.modulate=colors[randi_range(0,colors.size()-1)]
		white=false
	else:
		label.modulate=Color(1.0, 1.0, 1.0, 1.0)
		white=true
