extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal moveUsed(move : String)
@onready var move_handler: Node2D = $"."

@onready var move_1: TextureButton = $move1
@onready var move_1_lab: Label = $move1/move1Lab
@onready var move_2: TextureButton = $move2
@onready var move_2_lab: Label = $move2/move2Lab
@onready var move_3: TextureButton = $move3
@onready var move_3_lab: Label = $move3/move3Lab
@onready var move_4: TextureButton = $move4
@onready var move_4_lab: Label = $move4/move4Lab

func _ready() -> void:
	move_handler.visible=false
	
func _process(delta: float) -> void:
	if get_parent().getChar()=="frog":
		move_1_lab.text="Arrow Barrage"
		move_2_lab.text="Block"
		move_3_lab.text="Strike"
		move_4_lab.text="Frogsicle"

func fadeIn()->void:
	animation_player.play("fadeIn")


func _on_move_1_pressed() -> void:
	animation_player.play("press1")
	moveUsed.emit(move_1_lab.text)


func _on_move_2_pressed() -> void:
	animation_player.play("press2")
	moveUsed.emit(move_2_lab.text)


func _on_move_3_pressed() -> void:
	animation_player.play("press3")
	moveUsed.emit(move_3_lab.text)


func _on_move_4_pressed() -> void:
	animation_player.play("press4")
	moveUsed.emit(move_4_lab.text)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name!="fadeIn":
		move_handler.visible=false
		animation_player.play("RESET")
