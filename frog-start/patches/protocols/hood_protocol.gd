extends Node2D
@onready var frog_protocol: Node2D = $"."
var spawnLoca:=Vector2.ZERO
@onready var sprite_2d: Sprite2D = $spinner/Sprite2D
@onready var spinner: Sprite2D = $spinner
var cooldown:=2.0
var activeCooldown:=0.0
@onready var animation_player: AnimationPlayer = $spinner/Sprite2D/AnimationPlayer
@onready var frog_layer: CanvasLayer = $frogLayer
@export var deactivated=false
@export var bonus:=0
var dead=false
var attack=preload("res://patches/protocols/sword_shot.tscn")
var shot:=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnLoca=self.global_position

func die()->void:
	dead=true
	deactivated=true
	animation_player.play("die")
func alive()->void:
	dead=false
	deactivated=false
	animation_player.play("undie")

func protAnim()->void:
	#var goToX:=0
	#var goToY:=0
	#if self.global_position.x<spawnLoca.x:
		#goToX=spawnLoca.x+randi_range(10,40)
	#else:
		#goToX=spawnLoca.x-randi_range(10,40)
	#if goToX<spawnLoca.y-30:
		#goToY=spawnLoca.y-randi_range(30,60)
	#else:
		#goToY=spawnLoca.y-randi_range(0,30)
	#var tween = create_tween()
	#tween.tween_property(self,"global_position",Vector2(goToX,goToY),1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	#await tween.finished
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !dead:
		activeCooldown+=1*delta
	if activeCooldown>cooldown-0.35:
		if !deactivated && !shot:
			shot=true
			var attA=attack.instantiate()
			if bonus==2:
				attA.cripp=true
			await get_tree().create_timer(0.2).timeout
			attA.spawnLoca=sprite_2d.global_position
			if deactivated:
				attA.queue_free()
			frog_layer.add_child(attA)
			if bonus==1:
				await get_tree().create_timer(0.05).timeout
				var attA2=attack.instantiate()
				await get_tree().create_timer(0.2).timeout
				attA2.spawnLoca=sprite_2d.global_position
				if deactivated:
					attA2.queue_free()
				frog_layer.add_child(attA2)
	if activeCooldown>cooldown-0.25:
		if animation_player.current_animation!="flash" && !deactivated:
			animation_player.play("flash")
			
	if activeCooldown>=cooldown:
		activeCooldown=0
		shot=false
		
			
	spinner.rotation_degrees=90+(360*(activeCooldown/cooldown))
	sprite_2d.rotation_degrees=0-spinner.rotation_degrees
