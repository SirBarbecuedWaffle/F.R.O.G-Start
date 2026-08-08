extends Node2D
@onready var frog_protocol: Node2D = $"."
var spawnLoca:=Vector2.ZERO
@onready var sprite_2d: Sprite2D = $spinner/Sprite2D
@onready var spinner: Sprite2D = $spinner
var cooldown:=25.0
var activeCooldown:=0.0
@onready var animation_player: AnimationPlayer = $spinner/Sprite2D/AnimationPlayer
@onready var frog_layer: CanvasLayer = $frogLayer
@export var deactivated=false
@export var bonus:=0
var dead=false
var attack=preload("res://patches/protocols/variableCurse.tscn")

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
	protAnim()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !dead:
		activeCooldown+=1*delta
	if activeCooldown>cooldown-0.25:
		if animation_player.current_animation!="flash" && !deactivated:
			animation_player.play("flash")
			
	if activeCooldown>=cooldown:
		activeCooldown=0
		if !deactivated:
			var attA=attack.instantiate()
			attA.type=1
			if bonus==1:
				attA.type=0
			if bonus==2:
				attA.type=4
			frog_layer.add_child(attA)
				
			
	spinner.rotation_degrees=90+(360*(activeCooldown/cooldown))
	sprite_2d.rotation_degrees=0-spinner.rotation_degrees
