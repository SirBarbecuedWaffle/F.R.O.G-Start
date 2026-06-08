extends Node2D

var aliveEnemies:=0
var curEnems=[0,0,0,0]
var snowmanAnim=preload("res://battles/enemyFrames/snowmanEnemy.tres")
signal victory
@export var totalXP=0
@export var xpMultiplier:=100

func _ready() -> void:
	var allowance=randi_range(2,3+PManager.allowance)
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
