extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var xp_label: Label = $xpLabel
@onready var time_label: Label = $timeLabel
@onready var down_label: Label = $downLabel
@onready var enemy_handler: Node2D = $"../enemyHandler"
var totalTime:=0.0
var canClose:=false
var xpGained:=0
var timeAT:=0
var downs:=0
var displaydowns:=0
var collecting:=false
@onready var animation_playerClose: AnimationPlayer = $"../../CanvasLayer/Control/AnimationPlayer"

func _process(delta: float) -> void:
	if self.modulate!=Color(1.0, 1.0, 1.0, 0.0):
		xp_label.text="XP: "+str(xpGained)
		down_label.text="DEATHS: "+str(displaydowns)
		if int(timeAT)%60<10:
			time_label.text="TIME: "+str(  int(int(timeAT)/60))+":0"+str(int(timeAT)%60)
		else:
			time_label.text="TIME: "+str(  int(int(timeAT)/60))+":"+str(int(timeAT)%60)
	else:
		totalTime+=1*delta
	if canClose:
		if Input.is_action_just_pressed("lClick"):
			var tweenc = create_tween()
			tweenc.tween_property(self,"timeAT",0,1.5)
			var oldXP=xpGained
			var tweencr = create_tween()
			tweencr.tween_property(self,"xpGained",oldXP+(oldXP * exp(-0.0115 * totalTime)),1.5)
			
			await tweencr.finished
			await get_tree().create_timer(0.3).timeout
			
			var tweence = create_tween()
			tweence.tween_property(self,"displaydowns",0,1.0)
			var oldXP2=xpGained
			var tweencre = create_tween()
			tweencre.tween_property(self,"xpGained",oldXP2*(1-(downs*0.05)),1.0)
			
			await tweencre.finished
			for i in range(4):
				if CManager.party[i]!=0:
					var curChar=CManager.party[i]
					CManager.charXP[curChar-1]+=xpGained
			
			var tweencred = create_tween()
			tweencred.tween_property(self,"xpGained",0,1.0)
			await tweencred.finished
			await get_tree().create_timer(0.1).timeout
			animation_player.play_backwards("loadIn")
			await get_tree().create_timer(0.6).timeout
			animation_playerClose.play_backwards("loadIn")

func updateLabels()->void:
	var tweenc = create_tween()
	tweenc.tween_property(self,"xpGained",enemy_handler.totalXP,3.0)
	
	await tweenc.finished
	var tweencr = create_tween()
	tweencr.tween_property(self,"timeAT",totalTime,2.0)
	await tweencr.finished
	var tweencre = create_tween()
	tweencre.tween_property(self,"displaydowns",downs,1.0)
	await tweencre.finished
	canClose=true
		
func playerDowned()->void:
	downs+=1

func _on_enemy_handler_victory() -> void:
	animation_player.play("loadIn")
	await get_tree().create_timer(1.0).timeout
	updateLabels()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if canClose:
		get_tree().change_scene_to_file("res://overworld/overworld.tscn")
