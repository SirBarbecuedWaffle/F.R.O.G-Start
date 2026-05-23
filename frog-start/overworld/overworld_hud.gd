extends Control
@onready var transition_animator: AnimationPlayer = $CanvasLayer/transitionAnimation/transitionAnimator
@onready var party_menu: ColorRect = $CanvasLayer2/partyMenu
@onready var color_rect: ColorRect = $CanvasLayer2/partyButton/ColorRect

func transition()->void:
	transition_animator.play("transition")

func _process(delta: float) -> void:
	pass
	
func _on_party_button_pressed() -> void:
	if party_menu.visible==false:
		party_menu.visible=true
		PManager.paused=true
		#color_rect.color=Color(0.388, 0.576, 0.996, 0.816)
		color_rect.color=Color(1.0, 0.812, 0.0, 0.816)
	else:
		PManager.paused=false
		party_menu.visible=false
		color_rect.color=Color(0.388, 0.576, 0.996, 0.816)
