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
	encounter_timer.paused=!(player.velocity!=Vector2.ZERO) || PManager.paused==true || player.itemPicked!=0

func _on_encounter_timer_timeout() -> void:
	PManager.playerX=player.global_position.x
	PManager.playerY=player.global_position.y
	player.battleStart()
	await get_tree().create_timer(0.5).timeout
	overworld_hud.transition()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://battles/enemy_battle.tscn")


func _on_boss_trigger_start_boss(bossN : int) -> void:
	PManager.playerX=player.global_position.x
	PManager.playerY=player.global_position.y
	player.itemPicked=1
	overworld_hud.transition()
	await get_tree().create_timer(0.5).timeout
	if bossN==1:
		PManager.beatBoss1=true
		get_tree().change_scene_to_file("res://battles/boss_battle.tscn")
