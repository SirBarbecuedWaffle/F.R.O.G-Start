extends Node2D
@onready var player: Player = $player
@onready var encounter_timer: Timer = $encounterTimer
@onready var overworld_hud: Control = $overworldHUD

func _ready() -> void:
	CManager.updateXP()
	encounter_timer.start(randi_range(4,8))
	player.global_position.x=PManager.playerX
	player.global_position.y=PManager.playerY

func _physics_process(delta: float) -> void:
	encounter_timer.paused=!player.velocity!=Vector2.ZERO
	print(encounter_timer.time_left)


func _on_encounter_timer_timeout() -> void:
	PManager.playerX=player.global_position.x
	PManager.playerY=player.global_position.y
	player.battleStart()
	await get_tree().create_timer(0.5).timeout
	overworld_hud.transition()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://battles/enemy_battle.tscn")
