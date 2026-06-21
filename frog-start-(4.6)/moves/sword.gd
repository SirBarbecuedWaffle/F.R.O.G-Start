extends Sprite2D
@onready var timer: Timer = $Timer
@onready var strike_projectile: damager = $strikeProjectile
@onready var strike_projectile_2: damager = $strikeProjectile2
@onready var strike_projectile_3: damager = $strikeProjectile3
var speed:=1800
@export var damage:=2
func _ready() -> void:
	strike_projectile.damage=damage
	strike_projectile_2.damage=damage-1
	strike_projectile_2.damage=damage-1
func _process(delta: float) -> void:
	speed*=1.01
	global_position.x-=speed*delta
	if global_position.x<-200:
		queue_free()


func _on_timer_timeout() -> void:
	modulate=Color(255,randf_range(0.3,1),randf_range(0.3,1))
	timer.start()
