extends Node2D
@onready var health_bar: Sprite2D = $healthBar
@onready var turn_bar: Sprite2D = $turnBar
@onready var health_label: Label = $healthLabel

@export var health:=140.0
@export var maxHealth:=140.0
@export var moveProgress:=0.0
@export var poison:=0
@export var fire:=0
@export var atkDown:=0
@export var defDown:=0
@export var spdDown:=0
@export var atkUp:=0
@export var defUp:=0
@export var spdUp:=0
@export var stun:=0
var turnTime:=randi_range(120,450)

func _process(delta: float) -> void:
	if health>maxHealth:
		health=maxHealth
	health_label.text=str(int(health))
	health-=0.25
	if health>0:
		health_label.modulate=Color(1.0, 1.0, 1.0, 1.0)
		turn_bar.scale.x=(moveProgress/turnTime)*0.354
		health_bar.scale.x=(health/maxHealth)*-0.377
		if moveProgress<turnTime:
			moveProgress+=1
	else:
		health_label.modulate=Color(1.0, 0.0, 0.0, 1.0)
