extends Sprite2D
@onready var timer: Timer = $Timer

@onready var strike_projectile: damager = $strikeProjectile

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var speed:=1800
@export var damage:=10
@export var crip:=false
func _ready() -> void:
	strike_projectile.damage=damage
	

func _process(delta: float) -> void:
	if crip:
		strike_projectile.strRev=2
	if global_position.x<-200:
		queue_free()


func _on_timer_timeout() -> void:
	modulate=Color(255,randf_range(0.3,1),randf_range(0.3,1))
	timer.start()


func _on_strike_projectile_area_entered(area: Area2D) -> void:
	if global_position.x<1013:
		queue_free()
