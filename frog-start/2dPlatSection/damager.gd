extends Area2D
@export var damage:=1.5
@export var oneHit:=false
@export var knockback:=false



func _on_area_entered(area: Area2D) -> void:
	if oneHit:
		self.queue_free()
