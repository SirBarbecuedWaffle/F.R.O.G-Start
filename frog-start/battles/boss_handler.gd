extends Node2D

var aliveEnemies:=0
var curEnems=[0,0,0,0]
var snowmanAnim=preload("res://battles/enemyFrames/snowmanEnemy.tres")
signal victory
@export var totalXP=0
@export var xpMultiplier:=100
@onready var frog_layer: CanvasLayer = $".."
var fireball=preload("res://moves/fireball.tscn")
var sicle=preload("res://moves/frogsicle.tscn")
var sicle2=preload("res://patches/frogsicle2.tscn")
var sicle3=preload("res://patches/frogsicle3.tscn")
var smite=preload("res://moves/smite_move.tscn")
var sfired=preload("res://moves/Fired.tscn")
@onready var boss: Node2D = $boss

func _ready() -> void:
	if boss.bossType==1:
		totalXP+=5
	await get_tree().create_timer(0.1).timeout
	for d in range(4):
		if CManager.currentPatches[d]==5:
			xpMultiplier*=2
			boss.maxHealth*=1.5
			boss.health*=1.5
			boss.attackDamage*=1.5
			boss.attackSpeed*=0.7



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_perished(type : int) -> void:
	totalXP*=xpMultiplier
	aliveEnemies-=1
	if aliveEnemies<1:
		victory.emit()
	else:
		await get_tree().create_timer(0.2).timeout
		var count:=-1
		for g in CManager.currentPatches:
			count+=1
			if g==15:
				if CManager.party[count]==4:
					var fired=fireball.instantiate()
					fired.multiplier=1.5
					frog_layer.add_child(fired)
				elif CManager.party[count]==6:
					var firede=sfired.instantiate()
					firede.odds=5
					frog_layer.add_child(firede)
				else:
					var fired=fireball.instantiate()
					frog_layer.add_child(fired)
			if g==19:
				if CManager.party[count]==1:
					var fired=sicle3.instantiate()			
					frog_layer.add_child(fired)
				elif CManager.party[count]==9:
					var fired=sicle2.instantiate()			
					frog_layer.add_child(fired)
				else:
					var fired=sicle.instantiate()			
					frog_layer.add_child(fired)
			if g==20:
				var fired=smite.instantiate()
				if CManager.party[count]==5:
					fired.multiplier=2
				if CManager.party[count]==8:
					fired.defDown=30
				frog_layer.add_child(fired)
