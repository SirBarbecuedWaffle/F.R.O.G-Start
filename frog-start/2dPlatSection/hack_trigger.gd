extends Area2D
class_name hackTrigger
signal trigHack
signal trigHighLight
signal trigUnLight
@onready var hack_reader_2: Area2D = $hackReader2

func _on_hack_reader_area_entered(area: Area2D) -> void:
	trigHighLight.emit()


func _on_hack_reader_2_area_entered(area: Area2D) -> void:
	trigHack.emit()



func _on_hack_reader_area_exited(area: Area2D) -> void:
	trigUnLight.emit()
