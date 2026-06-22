extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal moveUsed(move : String)

@onready var singleTarIcon=preload("res://moves/moveAssets/singleMoveIcon.png")
@onready var singleTarHover=preload("res://moves/moveAssets/singleMoveHover.png")
@onready var HealMoveIcon=preload("res://moves/moveAssets/healMoveIcon.png")
@onready var HealMoveHover=preload("res://moves/moveAssets/healMoveHover.png")
@onready var MultiMoveIcon=preload("res://moves/moveAssets/multiMoveIcon.png")
@onready var MultiMoveHover=preload("res://moves/moveAssets/multiMoveHover.png")
@onready var BuffMoveIcon=preload("res://moves/moveAssets/buffMoveIcon.png")
@onready var BuffMoveHover=preload("res://moves/moveAssets/buffMoveHover.png")
@onready var deBuffMoveIcon=preload("res://moves/moveAssets/dbuffMoveIcon.png")
@onready var deBuffMoveHover=preload("res://moves/moveAssets/dbuffMoveHover.png")
@onready var poisMoveIcon=preload("res://moves/moveAssets/poisonMoveIcon.png")
@onready var poisMoveHover=preload("res://moves/moveAssets/poisonMoveHover.png")
@onready var fireMoveIcon=preload("res://moves/moveAssets/fireMoveIcon.png")
@onready var fireMoveHover=preload("res://moves/moveAssets/fireMoveHover.png")
@onready var stunMoveIcon=preload("res://moves/moveAssets/stunMoveIcon.png")
@onready var stunMoveHover=preload("res://moves/moveAssets/stunMoveHover.png")
@onready var instaKillHover=preload("res://moves/moveAssets/instakillHoverAIcon.png")
@onready var instaKillIcon=preload("res://moves/moveAssets/instakillMoveIcon.png")
@onready var glitchHover=preload("res://moves/moveAssets/glitchHoverAIcon.png")
@onready var glitchIcon=preload("res://moves/moveAssets/glitchIcon.png")
@onready var gorf_timer: Timer = $gorfTimer

var moves1=["Arrow Barrage","Overclock","All Skill Baby","Sword Barrage","Coffee Break","Fireball","Arrow Barrage 2","Infect 2"]
var moves2=["Block","Zip Bomb","Strike","Strength Spell","Cannon Barrage","You're Fired","Alt F4","Curse: Corrupt"]
var moves3=["Strike","Infect","Curse: Weaken","Health Potion","Smite","Fireball","Pummel","Pressure Wash","Bluescreen","Even More Skill"]
var moves4=["Frogsicle","Alt F4","Curse: Poison","Fireball","Electrocute","Scald","Flashbang","Toxic Fumes","Bottoms Up","DDoS"]
@onready var move_handler: Node2D = $"."

@onready var move_1: TextureButton = $move1Control/move1
@onready var move_1_lab: Label = $move1Control/move1/move1Lab
@onready var move_2: TextureButton = $move2Control/move2
@onready var move_2_lab: Label = $move2Control/move2/move2Lab
@onready var move_3: TextureButton = $move3Control/move3
@onready var move_3_lab: Label = $move3Control/move3/move3Lab
@onready var move_4: TextureButton = $move4Control/move4
@onready var move_4_lab: Label = $move4Control/move4/move4Lab

@onready var move_explainer: Label = $CanvasLayer/moveExplainer
@onready var explan_animator: AnimationPlayer = $CanvasLayer/explanAnimator
var moveHovered :=""

func _ready() -> void:
	move_handler.visible=false

func _process(delta: float) -> void:
	if moveHovered=="":
		move_explainer.text="Hover over a move to see what it does"
	if moveHovered=="Strike":
		move_explainer.text="Deals medium damage to a single random enemy"
	if moveHovered=="Arrow Barrage":
		move_explainer.text="Deals low damage and applies three random debuffs to random enemies"
	if moveHovered=="Block":
		move_explainer.text="Temporarily raises the defense of your entire party"
	if moveHovered=="Frogsicle":
		move_explainer.text="Applies medium heals to your entire party"
	if moveHovered=="Overclock":
		move_explainer.text="Temporarily raises the speed of your entire party"
	if moveHovered=="Zip Bomb":
		move_explainer.text="Deals medium damage to every enemy"
	if moveHovered=="Infect":
		move_explainer.text="Deals medium damage and poisons a single enemy"
	if moveHovered=="Infect 2":
		move_explainer.text="Deals high damage and deeply poisons a single enemy"
	if moveHovered=="Alt F4":
		move_explainer.text="Has a 1/5 chance to instakill a random non-boss enemy"
	if moveHovered=="All Skill Baby":
		move_explainer.text="Repeatedly flips a coin, if heads, deals high damage, if tails, stops flipping"
	if moveHovered=="Curse: Weaken":
		move_explainer.text="Temporarily lowers the attack of every enemy"
	if moveHovered=="Curse: Poison":
		move_explainer.text="Temporarily applies mild poison to every enemy"
	if moveHovered=="Fireball":
		move_explainer.text="Deals medium damage to a single enemy while applying temporary burn to nearby enemies"
	if moveHovered=="Strength Spell":
		move_explainer.text="Temporarily raises the attack power of your entire party"
	if moveHovered=="Sword Barrage":
		move_explainer.text="Fires a barrage of low damage swords"
	if moveHovered=="Health Potion":
		move_explainer.text="Heals and temporarily regens your entire party"
	if moveHovered=="Cannon Barrage":
		move_explainer.text="Spawns 3 cannons that occasionally deal low damage to enemies"
	if moveHovered=="Smite":
		move_explainer.text="Deals medium damage to a single enemy and temporarily lowers their defense"
	if moveHovered=="Electrocute":
		move_explainer.text="Burns and temporarily stuns a single enemy"
	if moveHovered=="Scald":
		move_explainer.text="Afflicts heavy burn to a single target"
	if moveHovered=="Paper Jam":
		move_explainer.text="Deals low damage to random enemies"
	if moveHovered=="You're Fired":
		move_explainer.text="Has a 1/8 chance to kill every enemy, burns them regardless"
	if moveHovered=="Coffee Break":
		move_explainer.text="Heals and temporarily speeds up the entire party"
	if moveHovered=="Even More Skill":
		move_explainer.text="Rolls 3 dice, causing a different effect to happen based on the numbers rolled"
	if moveHovered=="Pummel":
		move_explainer.text="Hits a random enemy three times, lowering the attack of the last enemy hit"
	if moveHovered=="Flashbang":
		move_explainer.text="Briefly stuns every enemy and party member"
	if moveHovered=="Toxic Fumes":
		move_explainer.text="Temporarily poisons and slows every enemy"
	if moveHovered=="Bottoms Up":
		move_explainer.text="Heals and temporarily raises the attack of the entire party"
	if moveHovered=="Pressure Wash":
		move_explainer.text="Cleanses the entire party of negative effects and damages all enemies"
	
	if get_parent().getChar()=="frog":
		move_1_lab.text="Arrow Barrage"
		move_2_lab.text="Block"
		move_3_lab.text="Strike"
		move_4_lab.text="Frogsicle"
	if get_parent().getChar()=="steve":
		move_1_lab.text="Overclock"
		move_2_lab.text="Zip Bomb"
		move_3_lab.text="Infect"
		move_4_lab.text="Alt F4"
	if get_parent().getChar()=="mask":
		move_1_lab.text="All Skill Baby"
		move_2_lab.text="Strike"
		move_3_lab.text="Curse: Weaken"
		move_4_lab.text="Curse: Poison"
	if get_parent().getChar()=="pink":
		move_1_lab.text="Sword Barrage"
		move_2_lab.text="Strength Spell"
		move_3_lab.text="Health Potion"
		move_4_lab.text="Fireball"
	if get_parent().getChar()=="robot":
		move_1_lab.text="Overclock"
		move_2_lab.text="Cannon Barrage"
		move_3_lab.text="Smite"
		move_4_lab.text="Electrocute"
	if get_parent().getChar()=="joe":
		move_1_lab.text="Coffee Break"
		move_2_lab.text="You're Fired"
		move_3_lab.text="Fireball"
		move_4_lab.text="Scald"
	if get_parent().getChar()=="fox":
		move_1_lab.text="All Skill Baby"
		move_2_lab.text="Alt F4"
		move_3_lab.text="Even More Skill"
		move_4_lab.text="Flashbang"
	if get_parent().getChar()=="lizard":
		move_1_lab.text="Infect 2"
		move_2_lab.text="Cannon Barrage"
		move_3_lab.text="Pummel"
		move_4_lab.text="Toxic Fumes"
	if get_parent().getChar()=="barrel":
		move_1_lab.text="Coffee Break"
		move_2_lab.text="Block"
		move_3_lab.text="Pressure Wash"
		move_4_lab.text="Bottoms Up"
	#if get_parent().getChar()=="gorf":
		#move_1_lab.text="Arrow Barrage 2"
		#move_2_lab.text="Curse: Corrupt"
		#move_3_lab.text="Bluescreen"
		#move_4_lab.text="DDoS"
		
		
	if move_1_lab.text=="All Skill Baby" || move_1_lab.text=="Sword Barrage":
		move_1.texture_hover=MultiMoveHover
		move_1.texture_normal=MultiMoveIcon
	if move_1_lab.text=="Arrow Barrage":
		move_1.texture_hover=deBuffMoveHover
		move_1.texture_normal=deBuffMoveIcon
	if move_1_lab.text=="Overclock":
		move_1.texture_hover=BuffMoveHover
		move_1.texture_normal=BuffMoveIcon
	if move_1_lab.text=="Fireball":
		move_1.texture_hover=fireMoveHover
		move_1.texture_normal=fireMoveIcon
	if move_1_lab.text=="Coffee Break":
		move_1.texture_hover=HealMoveHover
		move_1.texture_normal=HealMoveIcon
	if move_1_lab.text=="Infect" || move_1_lab.text=="Infect 2":
		move_1.texture_hover=poisMoveHover
		move_1.texture_normal=poisMoveIcon
		
	if move_2_lab.text=="Zip Bomb" || move_2_lab.text=="Cannon Barrage":
		move_2.texture_hover=MultiMoveHover
		move_2.texture_normal=MultiMoveIcon
	if move_2_lab.text=="Block" || move_2_lab.text=="Strength Spell":
		move_2.texture_hover=BuffMoveHover
		move_2.texture_normal=BuffMoveIcon
	if move_2_lab.text=="Strike":
		move_2.texture_hover=singleTarHover
		move_2.texture_normal=singleTarIcon
	if move_4_lab.text=="You're Fired":
		move_4.texture_normal=instaKillIcon
		move_4.texture_hover=instaKillHover
	if move_2_lab.text=="You're Fired":
		move_2.texture_normal=instaKillIcon
		move_2.texture_hover=instaKillHover
		
	if move_3_lab.text=="Strike" || move_3_lab.text=="Even More Skill":
		move_3.texture_hover=singleTarHover
		move_3.texture_normal=singleTarIcon
	if move_3_lab.text=="Curse: Weaken" || move_3_lab.text=="Smite" || move_3_lab.text=="Pummel":
		move_3.texture_hover=deBuffMoveHover
		move_3.texture_normal=deBuffMoveIcon
	if move_3_lab.text=="Health Potion":
		move_3.texture_hover=HealMoveHover
		move_3.texture_normal=HealMoveIcon
	if move_3_lab.text=="Infect":
		move_3.texture_hover=poisMoveHover
		move_3.texture_normal=poisMoveIcon
	if move_3_lab.text=="Paper Jam":
		move_3.texture_hover=MultiMoveHover
		move_3.texture_normal=MultiMoveIcon
	if move_3_lab.text=="Fireball":
		move_3.texture_hover=fireMoveHover
		move_3.texture_normal=fireMoveIcon
	if move_3_lab.text=="Pressure Wash":
		move_3.texture_hover=MultiMoveHover
		move_3.texture_normal=MultiMoveIcon
		
	if move_4_lab.text=="Bottoms Up":
		move_4.texture_hover=BuffMoveHover
		move_4.texture_normal=BuffMoveIcon
	if move_4_lab.text=="Curse: Poison" || move_4_lab.text=="Toxic Fumes":
		move_4.texture_hover=poisMoveHover
		move_4.texture_normal=poisMoveIcon
	if move_4_lab.text=="Fireball" || move_4_lab.text=="Scald":
		move_4.texture_hover=fireMoveHover
		move_4.texture_normal=fireMoveIcon	
	if move_4_lab.text=="Alt F4":
		move_4.texture_normal=instaKillIcon
		move_4.texture_hover=instaKillHover
	if move_2_lab.text=="Alt F4":
		move_2.texture_normal=instaKillIcon
		move_2.texture_hover=instaKillHover
	if move_4_lab.text=="Electrocute" || move_4_lab.text=="Flashbang":
		move_4.texture_hover=stunMoveHover
		move_4.texture_normal=stunMoveIcon
	if move_4_lab.text=="Frogsicle" || move_4_lab.text=="Coffee Break":
		move_4.texture_hover=HealMoveHover
		move_4.texture_normal=HealMoveIcon
	
	
	if move_1_lab.text=="Arrow Barrage 2":
		move_1.texture_hover=glitchHover
		move_1.texture_normal=glitchIcon
	if move_2_lab.text=="Curse: Corrupt":
		move_2.texture_hover=glitchHover
		move_2.texture_normal=glitchIcon
	if move_3_lab.text=="Bluescreen":
		move_3.texture_hover=glitchHover
		move_3.texture_normal=glitchIcon
	if move_4_lab.text=="DDoS":
		move_4.texture_hover=glitchHover
		move_4.texture_normal=glitchIcon

func fadeIn()->void:
	moveHovered=""
	animation_player.play("fadeIn")
	explan_animator.play("showText")

func _on_move_1_pressed() -> void:
	if explan_animator.current_animation!="hideText" && move_handler.modulate!=Color(1.0, 1.0, 1.0, 0.0):
		animation_player.play("press1")
		moveUsed.emit(move_1_lab.text)
		explan_animator.play("hideText")


func _on_move_2_pressed() -> void:
	if explan_animator.current_animation!="hideText" && move_handler.modulate!=Color(1.0, 1.0, 1.0, 0.0):
		animation_player.play("press2")
		moveUsed.emit(move_2_lab.text)
		explan_animator.play("hideText")


func _on_move_3_pressed() -> void:
	if explan_animator.current_animation!="hideText" && move_handler.modulate!=Color(1.0, 1.0, 1.0, 0.0):
		animation_player.play("press3")
		moveUsed.emit(move_3_lab.text)
		explan_animator.play("hideText")


func _on_move_4_pressed() -> void:
	if explan_animator.current_animation!="hideText" && move_handler.modulate!=Color(1.0, 1.0, 1.0, 0.0):
		animation_player.play("press4")
		moveUsed.emit(move_4_lab.text)
		explan_animator.play("hideText")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name!="fadeIn":
		move_handler.visible=false
		animation_player.play("RESET")


func _on_move_mouse_entered() -> void:
	moveHovered=move_1_lab.text
	


func _on_move_mouse_exited() -> void:
	moveHovered=""


func _on_move_2_mouse_entered() -> void:
	moveHovered=move_2_lab.text


func _on_move_3_mouse_entered() -> void:
	moveHovered=move_3_lab.text


func _on_move_4_mouse_entered() -> void:
	moveHovered=move_4_lab.text


func _on_gorf_timer_timeout() -> void:
	gorf_timer.start(randf_range(0.2,1.0))
	if get_parent().getChar()=="gorf":
		move_1_lab.text=moves1[randi_range(0,moves1.size()-1)]
		move_2_lab.text=moves2[randi_range(0,moves2.size()-1)]
		move_3_lab.text=moves3[randi_range(0,moves3.size()-1)]
		move_4_lab.text=moves4[randi_range(0,moves4.size()-1)]
