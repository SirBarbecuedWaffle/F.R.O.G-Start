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
	if item<15:
		animated_sprite_2d.play("mediumpatch")
	if item<6:
		animated_sprite_2d.play("smallpatch")
	
	if item==1:
		patch_name.text="Headstart: Defense"
	if item==2:
		patch_name.text="Headstart: Strength"
	
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
