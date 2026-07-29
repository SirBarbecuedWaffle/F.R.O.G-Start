extends Node2D
@onready var frog_protocol: Node2D = $"."
var spawnLoca:=Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnLoca=self.global_position
	protAnim()

func protAnim()->void:
	var goToX:=0
	var goToY:=0
	if self.global_position.x<spawnLoca.x:
		goToX=spawnLoca.x+randi_range(10,40)
	else:
		goToX=spawnLoca.x-randi_range(10,40)
	if goToX<spawnLoca.y-30:
		goToY=spawnLoca.y-randi_range(30,60)
	else:
		goToY=spawnLoca.y-randi_range(0,30)
	var tween = create_tween()
	tween.tween_property(self,"global_position",Vector2(goToX,goToY),0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	protAnim()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
