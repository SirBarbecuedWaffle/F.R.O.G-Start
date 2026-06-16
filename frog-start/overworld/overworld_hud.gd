extends Control
@onready var transition_animator: AnimationPlayer = $CanvasLayer/transitionAnimation/transitionAnimator
@onready var party_menu: ColorRect = $CanvasLayer2/partyMenu
@onready var color_rect: ColorRect = $CanvasLayer2/partyButton/ColorRect
@onready var itemcollect_box: Node2D = $CanvasLayer2/itemcollectBox
@onready var animated_sprite_2d: AnimatedSprite2D = $CanvasLayer2/itemcollectBox/AnimatedSprite2D
@onready var patch_name: Label = $CanvasLayer2/itemcollectBox/patchName
@onready var patch_menu: ColorRect = $CanvasLayer2/patchMenu
@onready var patch_back: ColorRect = $CanvasLayer2/patchesButton/patchBack

func transition()->void:
	transition_animator.play("transition")

func _process(delta: float) -> void:
	pass
	
func _on_party_button_pressed() -> void:
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
	if patch_menu.visible==false:
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
