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
var smite=preload("res://moves/smite_move.tscn")

func _ready() -> void:
	var allowance=randi_range(2,3+PManager.allowance)
	for d in range(4):
		if CManager.currentPatches[d]==5:
			allowance+=10
	while allowance/3.0>1:
		var curEnem=randi_range(2,3)
		allowance-=curEnem
		
		for i in range(4):
			if curEnems[i]==0:
				aliveEnemies+=1
				curEnems[i]=curEnem
				break
	while allowance>0:
		allowance-=1
		for i in range(4):
			if curEnems[i]==0:
				aliveEnemies+=1
				curEnems[i]=1
				break
	for e in range(4):
		if curEnems[e]!=0:
			if curEnems[e]==1:
				self.get_children()[e].maxHealth=30.0
				self.get_children()[e].attackSpeed=600.0
				self.get_children()[e].attackDamage=10.0
				self.get_children()[e].enemyType=1
			if curEnems[e]==2:
				self.get_children()[e].maxHealth=60.0
				self.get_children()[e].attackSpeed=400.0
				self.get_children()[e].attackDamage=20.0
				self.get_children()[e].enemyType=2
			if curEnems[e]==3:
				self.get_children()[e].maxHealth=110.0
				self.get_children()[e].attackSpeed=300.0
				self.get_children()[e].attackDamage=30.0
				self.get_children()[e].enemyType=3
		else:
			self.get_children()[e].queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_perished(type : int) -> void:
	
	totalXP+=xpMultiplier*type
	aliveEnemies-=1
	if aliveEnemies<1:
		victory.emit()
	else:
		await get_tree().create_timer(0.2).timeout
		for g in CManager.currentPatches:
			if g==15:
				var fired=fireball.instantiate()
				frog_layer.add_child(fired)
			if g==19:
				var fired=sicle.instantiate()
				frog_layer.add_child(fired)
			if g==20:
				var fired=smite.instantiate()
				frog_layer.add_child(fired)
