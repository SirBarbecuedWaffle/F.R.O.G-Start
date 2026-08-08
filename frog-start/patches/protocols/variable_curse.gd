extends Node2D
@onready var strike_projectile: damager = $strikeProjectile
var strikeVel:=150.0
@export var type:=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if type==0:
		type=randi_range(1,3)
	if type==1:
		strike_projectile.strRev=10
		strike_projectile.modulate=Color(0.847, 0.341, 0.0, 0.49)
	if type==2:
		strike_projectile.defRev=10
		strike_projectile.modulate=Color(0.269, 0.271, 1.0, 0.49)
	if type==3:
		strike_projectile.spdRev=10
		strike_projectile.modulate=Color(0.286, 0.341, 0.0, 0.49)
	if type==4:
		strike_projectile.poison=40
		strike_projectile.spdRev=10
		strike_projectile.modulate=Color(0.0, 0.573, 0.0, 0.49)
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	strikeVel*=1.025
	strike_projectile.global_position.x-=strikeVel*delta
	if strike_projectile.global_position.x<-500:
		queue_free()
