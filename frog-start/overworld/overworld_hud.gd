extends Control
@onready var transition_animator: AnimationPlayer = $CanvasLayer/transitionAnimation/transitionAnimator

func transition()->void:
	transition_animator.play("transition")
