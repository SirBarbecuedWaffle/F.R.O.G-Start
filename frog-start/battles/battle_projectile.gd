extends Area2D
class_name damager
@export var damage:=0
@export var poison:=0
@export var burn:=0
@export var strRev:=0
@export var defRev:=0
@export var spdRev:=0
@export var strBuf:=0
@export var spdBuf:=0
@export var defBuf:=0
@export var stun:=0.0
@export var regen:=0
@export var invincible:=0
@export var oneHit:=true
@export var randomNumbers:=false
@export var glitch:=false
@export var envenom:=false

func _ready() -> void:
	if randomNumbers:
		damage=randi_range(damage*0.95,damage*1.05)
