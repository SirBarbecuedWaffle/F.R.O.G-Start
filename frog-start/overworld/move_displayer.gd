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
@onready var name_label: Label = $"../../MenuBox2/nameLabel"
@onready var descript_label: Label = $"../../MenuBox2/descriptLabel"
@onready var move_type: Label = $moveType

var moves1=["Arrow Barrage","Overclock","All Skill Baby","Sword Barrage","Coffee Break","Fireball","Arrow Barrage 2"]
var moves2=["Block","Zip Bomb","Strike","Strength Spell","Cannon Barrage","You're Fired","Alt F4","Curse: Corrupt"]
var moves3=["Strike","Infect","Curse: Weaken","Health Potion","Smite","Fireball","Pummel","Bluescreen"]
var moves4=["Frogsicle","Alt F4","Curse: Poison","Fireball","Electrocute","Scald","Flashbang","Toxic Fumes","Bottoms Up","DDoS"]
@onready var move_handler: Node2D = $"."
@onready var party_menu: ColorRect = $"../.."

@onready var move_1_control: Node2D = $move1Control
@onready var move_1: TextureButton = $move1Control/move1
@onready var move_1_lab: Label = $move1Control/move1Lab
@onready var move_2_control: Node2D = $move2Control
@onready var move_2: TextureButton = $move2Control/move2
@onready var move_2_lab: Label = $move2Control/move2Lab
@onready var move_3_control: Node2D = $move3Control
@onready var move_3: TextureButton = $move3Control/move3
@onready var move_3_lab: Label = $move3Control/move3Lab
@onready var move_4_control: Node2D = $move4Control
@onready var move_4: TextureButton = $move4Control/move4
@onready var move_4_lab: Label = $move4Control/move4Lab
@onready var move_explainer: Label = $moveExplainer
@onready var tutdesc_lab: Label = $"../../MenuBox2/tutdescLab"


@onready var move_box: Sprite2D = $moveBox
@onready var explan_animator: AnimationPlayer = $CanvasLayer/explanAnimator
var moveHovered :=""


func _process(delta: float) -> void:
	print(move_1_control.global_position)
	if moveHovered=="":
		move_explainer.visible=false
		move_type.visible=false
		if tutdesc_lab.visible==false:
			name_label.visible=true
			descript_label.visible=true
	else:
		move_explainer.visible=true
		move_type.visible=true
		name_label.visible=false
		descript_label.visible=false
	if moveHovered=="Strike":
		move_explainer.text="Deals medium damage to a single random enemy"
		move_type.text="Type: Monotarget"
	if moveHovered=="Arrow Barrage":
		move_explainer.text="Deals low damage and applies three random debuffs to random enemies"
		move_type.text="Type: Debuff"
	if moveHovered=="Block":
		move_explainer.text="Temporarily raises the defense of your entire party"
		move_type.text="Type: Buff"
	if moveHovered=="Frogsicle":
		move_explainer.text="Applies medium heals to your entire party"
		move_type.text="Type: Support"
	if moveHovered=="Overclock":
		move_explainer.text="Temporarily raises the speed of your entire party"
		move_type.text="Type: Buff"
	if moveHovered=="Zip Bomb":
		move_explainer.text="Deals medium damage to every enemy"
		move_type.text="Type: Multitarget"
	if moveHovered=="Infect":
		move_explainer.text="Deals medium damage and poisons a single enemy"
		move_type.text="Type: Poison"
	if moveHovered=="Alt F4":
		move_explainer.text="Has a 1/5 chance to instakill a random non-boss enemy"
		move_type.text="Type: Cleaving"
	if moveHovered=="All Skill Baby":
		move_explainer.text="Repeatedly flips a coin, if heads, deals high damage, if tails, stops flipping"
		move_type.text="Type: Multitarget"
	if moveHovered=="Curse: Weaken":
		move_explainer.text="Temporarily lowers the attack of every enemy"
		move_type.text="Type: Debuff"
	if moveHovered=="Curse: Poison":
		move_explainer.text="Temporarily applies mild poison to every enemy"
		move_type.text="Type: Poison"
	if moveHovered=="Fireball":
		move_explainer.text="Deals medium damage to a single enemy and applies temporary burn to nearby enemies"
		move_type.text="Type: Fire"
	if moveHovered=="Strength Spell":
		move_explainer.text="Temporarily raises the attack power of your entire party"
		move_type.text="Type: Buff"
	if moveHovered=="Sword Barrage":
		move_explainer.text="Fires a barrage of low damage swords"
		move_type.text="Type: Multitarget"
	if moveHovered=="Health Potion":
		move_explainer.text="Heals and temporarily regens your entire party"
		move_type.text="Type: Support"
	if moveHovered=="Cannon Barrage":
		move_explainer.text="Spawns 3 cannons that occasionally deal low damage to enemies"
		move_type.text="Type: Multitarget"
	if moveHovered=="Smite":
		move_explainer.text="Deals medium damage to a single enemy and temporarily lowers their defense"
		move_type.text="Type: Debuff"
	if moveHovered=="Electrocute":
		move_explainer.text="Burns and temporarily stuns a single enemy"
		move_type.text="Type: Stun"
	if moveHovered=="Scald":
		move_explainer.text="Afflicts heavy burn to a single target"
		move_type.text="Type: Fire"
	if moveHovered=="Paper Jam":
		move_explainer.text="Deals low damage to random enemies"
		move_type.text="Type: ?????"
	if moveHovered=="You're Fired":
		move_explainer.text="Has a 1/8 chance to kill every enemy, burns them regardless"
		move_type.text="Type: Cleaving"
	if moveHovered=="Coffee Break":
		move_explainer.text="Heals and temporarily speeds up the entire party"
		move_type.text="Type: Buff"
	if moveHovered=="Pummel":
		move_explainer.text="Hits a random enemy three times, lowering the attack of the last enemy hit"
		move_type.text="Type: Debuff"
	if moveHovered=="Flashbang":
		move_explainer.text="Briefly stuns every enemy and party member"
		move_type.text="Type: Stun"
	if moveHovered=="Toxic Fumes":
		move_explainer.text="Temporarily poisons and slows every enemy"
		move_type.text="Type: Poison"
	if moveHovered=="Bottoms Up":
		move_explainer.text="Heals and temporarily raises the attack of the entire party"
		move_type.text="Type: Buff"
	if moveHovered=="Pressure Wash":
		move_explainer.text="Cleanses the entire party of negative effects and damages all enemies"
		move_type.text="Type: Buff"
	if moveHovered=="DDoS":
		move_explainer.text="Spawns 4 Zip Bombs that damage and severely stun every enemy"
		move_type.text="Type: %!^#&!"
	if moveHovered=="Bluescreen":
		move_explainer.text="Has a 1/2 chance to kill each non-boss enemy in the fight"
		move_type.text="Type: &!@*!#"
	if moveHovered=="Curse: Corrupt":
		move_explainer.text="Deals massive constant damage to every enemy and lowers their defense"
		move_type.text="Type: *!&@&@"
	if moveHovered=="Arrow Barrage 2":
		move_explainer.text="Deals heavy damage and applies every debuff to all enemies"
		move_type.text="Type: ^!@$#%"
	
	
	
	
	if party_menu.getChar()=="frog":
		move_1_lab.text="Arrow Barrage"
		move_2_lab.text="Block"
		move_3_lab.text="Strike"
		move_4_lab.text="Frogsicle"
	if party_menu.getChar()=="steve":
		move_1_lab.text="Overclock"
		move_2_lab.text="Zip Bomb"
		move_3_lab.text="Infect"
		move_4_lab.text="Alt F4"
	if party_menu.getChar()=="mask":
		move_1_lab.text="All Skill Baby"
		move_2_lab.text="Strike"
		move_3_lab.text="Curse: Weaken"
		move_4_lab.text="Curse: Poison"
	if party_menu.getChar()=="hood":
		move_1_lab.text="Sword Barrage"
		move_2_lab.text="Strength Spell"
		move_3_lab.text="Health Potion"
		move_4_lab.text="Fireball"
	if party_menu.getChar()=="robot":
		move_1_lab.text="Overclock"
		move_2_lab.text="Cannon Barrage"
		move_3_lab.text="Smite"
		move_4_lab.text="Electrocute"
	if party_menu.getChar()=="joe":
		move_1_lab.text="Coffee Break"
		move_2_lab.text="You're Fired"
		move_3_lab.text="Fireball"
		move_4_lab.text="Scald"
	if party_menu.getChar()=="fox":
		move_1_lab.text="All Skill Baby"
		move_2_lab.text="Alt F4"
		move_3_lab.text="Pummel"
		move_4_lab.text="Flashbang"
	if party_menu.getChar()=="lizard":
		move_1_lab.text="Fireball"
		move_2_lab.text="Cannon Barrage"
		move_3_lab.text="Pummel"
		move_4_lab.text="Toxic Fumes"
	if party_menu.getChar()=="barrel":
		move_1_lab.text="Coffee Break"
		move_2_lab.text="Block"
		move_3_lab.text="Pressure Wash"
		move_4_lab.text="Bottoms Up"
	if party_menu.getChar()=="gorF":
		move_1_lab.text="Arrow Barrage 2"
		move_2_lab.text="Curse: Corrupt"
		move_3_lab.text="Bluescreen"
		move_4_lab.text="DDoS"
		
		
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
	if move_1_lab.text=="Arrow Barrage 2":
		move_1.texture_hover=glitchHover
		move_1.texture_normal=glitchIcon
	if move_1_lab.text=="Coffee Break":
		move_1.texture_hover=HealMoveHover
		move_1.texture_normal=HealMoveIcon
	if move_2_lab.text=="Zip Bomb" || move_2_lab.text=="Cannon Barrage":
		move_2.texture_hover=MultiMoveHover
		move_2.texture_normal=MultiMoveIcon
	if move_2_lab.text=="Block" || move_2_lab.text=="Strength Spell":
		move_2.texture_hover=BuffMoveHover
		move_2.texture_normal=BuffMoveIcon
	if move_2_lab.text=="Strike":
		move_2.texture_hover=singleTarHover
		move_2.texture_normal=singleTarIcon
	if move_2_lab.text=="You're Fired":
		move_2.texture_normal=instaKillIcon
		move_2.texture_hover=instaKillHover
	if move_2_lab.text=="Curse: Corrupt":
		move_2.texture_hover=glitchHover
		move_2.texture_normal=glitchIcon
		
	if move_3_lab.text=="Strike":
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
		move_3.texture_hover=BuffMoveHover
		move_3.texture_normal=BuffMoveIcon
	if move_3_lab.text=="Bluescreen":
		move_3.texture_hover=glitchHover
		move_3.texture_normal=glitchIcon
		
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
	if move_4_lab.text=="DDoS":
		move_4.texture_hover=glitchHover
		move_4.texture_normal=glitchIcon

func fadeIn()->void:
	moveHovered=""
	animation_player.play("fadeIn")
	explan_animator.play("showText")

func _on_move_1_pressed() -> void:
	#if explan_animator.current_animation!="hideText":
		#animation_player.play("press1")
		#moveUsed.emit(move_1_lab.text)
		#explan_animator.play("hideText")
	pass


func _on_move_2_pressed() -> void:
	if explan_animator.current_animation!="hideText":
		animation_player.play("press2")
		moveUsed.emit(move_2_lab.text)
		explan_animator.play("hideText")


func _on_move_3_pressed() -> void:
	if explan_animator.current_animation!="hideText":	
		animation_player.play("press3")
		moveUsed.emit(move_3_lab.text)
		explan_animator.play("hideText")


func _on_move_4_pressed() -> void:
	if explan_animator.current_animation!="hideText":
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
	pass
