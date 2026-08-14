extends Control
@onready var transition_animator: AnimationPlayer = $CanvasLayer/transitionAnimation/transitionAnimator
@onready var party_menu: ColorRect = $CanvasLayer2/partyMenu
@onready var color_rect: ColorRect = $CanvasLayer2/partyButton/ColorRect
@onready var itemcollect_box: Node2D = $CanvasLayer2/itemcollectBox
@onready var animated_sprite_2d: AnimatedSprite2D = $CanvasLayer2/itemcollectBox/AnimatedSprite2D
@onready var patch_name: Label = $CanvasLayer2/itemcollectBox/patchName
@onready var patch_menu: ColorRect = $CanvasLayer2/patchMenu
@onready var patch_back: ColorRect = $CanvasLayer2/patchesButton/patchBack
@onready var party_rep: Node2D = $CanvasLayer2/patchMenu/partyRep

func _ready() -> void:
	patch_menu.visible=false

func transition()->void:
	transition_animator.play("transition")
	PManager.paused=false
	patch_menu.visible=false
	patch_back.color=Color(0.388, 0.576, 0.996, 0.816)
	party_menu.visible=false
	color_rect.color=Color(0.388, 0.576, 0.996, 0.816)

func _process(delta: float) -> void:
	pass
	
func _on_party_button_pressed() -> void:
	if transition_animator.current_animation!="transition":
		for i in range(4):
			if CManager.party[i]==10:
				CManager.currentPatches[i]=0
			if CManager.party[i]==0:
				CManager.currentPatches[i]=0
		if party_menu.visible==false:
			party_menu.visible=true
			patch_menu.visible=false
			patch_back.color=Color(0.388, 0.576, 0.996, 0.816)
			PManager.paused=true
			#color_rect.color=Color(0.388, 0.576, 0.996, 0.816)
			color_rect.color=Color(1.0, 0.812, 0.0, 0.816)
		else:
			PManager.paused=false
			party_menu.visible=false
			color_rect.color=Color(0.388, 0.576, 0.996, 0.816)


func _on_player_pickedup_item(item: int) -> void:
	
	itemcollect_box.visible=true
	if item<9:
		animated_sprite_2d.play("smallpatch")
	elif item<21:
		animated_sprite_2d.play("mediumpatch")
	else:
		animated_sprite_2d.play("largepatch")
	
	
	if item==1:
		patch_name.text="Headstart: Defense"
	if item==2:
		patch_name.text="Headstart: Strength"
	if item==3:
		patch_name.text="Headstart: Speed"
	if item==4:
		patch_name.text="Second: Nature"
	if item==5:
		patch_name.text="Boost: Difficulty"
	if item==6:
		patch_name.text="Protocol: Arrow"
	if item==7:
		patch_name.text="Protocol: Alt F4"
	if item==8:
		patch_name.text="Protocol: Curse"
	if item==9:
		patch_name.text="Boost: Health"
	if item==10:
		patch_name.text="Second: Chance"
	if item==11:
		patch_name.text="Endless: Defense"
	if item==12:
		patch_name.text="Endless: Strength"
	if item==13:
		patch_name.text="Endless: Speed"
	if item==14:
		patch_name.text="Second: Wind"
	if item==15:
		patch_name.text="Revenge: Fireball"
	if item==16:
		patch_name.text="Protocol: Sword"
	if item==17:
		patch_name.text="Protocol: Electrocute"
	if item==18:
		patch_name.text="Protocol: Caffeinate"
	if item==19:
		patch_name.text="Revenge: Frogsicle"
	if item==20:
		patch_name.text="Revenge: Smite"
	if item==21:
		patch_name.text="Block: Cleaving"
	if item==22:
		patch_name.text="Block: Stun"
	if item==23:
		patch_name.text="Block: Debuff"
	if item==24:
		patch_name.text="Counter: Strike"
	if item==25:
		patch_name.text="Counter: Pummel"
	if item==26:
		patch_name.text="Protocol: Gamble"
	if item==27:
		patch_name.text="Protocol: Pollute"
	if item==28:
		patch_name.text="Protocol: Hydrate"
	if item==29:
		patch_name.text="Counter: Electrocute"
	if item==30:
		patch_name.text="Boost: Experience"
	
	await get_tree().create_timer(3.15).timeout
	animated_sprite_2d.stop()
	itemcollect_box.visible=false


func _on_patches_button_pressed() -> void:
	if transition_animator.current_animation!="transition":
		for i in range(4):
			if CManager.party[i]==10:
				CManager.currentPatches[i]=0
			if CManager.party[i]==0:
				CManager.currentPatches[i]=0
		if patch_menu.visible==false:
			party_rep.updateParty()
			patch_menu.updateParty()
			party_menu.visible=false
			color_rect.color=Color(0.388, 0.576, 0.996, 0.816)
			patch_menu.visible=true
			PManager.paused=true
			#color_rect.color=Color(0.388, 0.576, 0.996, 0.816)
			patch_back.color=Color(1.0, 0.812, 0.0, 0.816)
		else:
			PManager.paused=false
			patch_menu.visible=false
			patch_back.color=Color(0.388, 0.576, 0.996, 0.816)


func _on_box_button_20_mouse_entered() -> void:
	pass # Replace with function body.
