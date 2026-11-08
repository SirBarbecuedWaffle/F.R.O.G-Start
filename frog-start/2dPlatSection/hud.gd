extends CanvasLayer

@onready var character_body_2d: CharacterBody2D = $".."

@onready var hearts = [
	$Health/heart1,
	$Health/heart2,
	$Health/heart3,
	$Health/heart4,
	$Health/heart5,
	$Health/heart6,
	$Health/heart7,
	$Health/heart8,
	$Health/heart9
]

var displayed_health: float


func _ready() -> void:
	for i in range(hearts.size()):
		var heart: AnimatedSprite2D = hearts[i]

		heart.visible = i < character_body_2d.maxHealth

		if heart.visible:
			heart.play("whole")

		heart.animation_finished.connect(
			func(): _on_heart_animation_finished(i)
		)

	character_body_2d.health = character_body_2d.maxHealth
	displayed_health = character_body_2d.health

	refresh_hearts()


func sync_health() -> void:
	if displayed_health != character_body_2d.health:
		advance_health_step()


func advance_health_step() -> void:
	if displayed_health > character_body_2d.health:
		displayed_health -= 0.5

	elif displayed_health < character_body_2d.health:
		displayed_health += 0.5

	refresh_hearts()


func refresh_hearts() -> void:
	for i in range(hearts.size()):
		var heart: AnimatedSprite2D = hearts[i]

		if !heart.visible:
			continue

		var heart_number = i + 1

		var target_state : String

		if displayed_health >= heart_number:
			target_state = "whole"
		elif displayed_health >= heart_number - 0.5:
			target_state = "half"
		else:
			target_state = "empty"

		match target_state:

			"whole":
				if heart.animation == "empty":
					heart.play("blinkMax")
				elif heart.animation == "half":
					heart.play("blinkFull")

			"half":
				if heart.animation == "whole":
					heart.play("blinkHalf")
				elif heart.animation == "empty":
					heart.play("blinkNone2Half")

			"empty":
				if heart.animation == "whole":
					heart.play("blinkFully")
				elif heart.animation == "half":
					heart.play("blinkNone")

func _on_heart_animation_finished(index : int) -> void:

	var heart: AnimatedSprite2D = hearts[index]

	match heart.animation:

		"blinkHalf":
			heart.play("half")

		"blinkNone":
			heart.play("empty")

		"blinkFull":
			heart.play("whole")

		"blinkNone2Half":
			heart.play("half")

		"blinkFully":
			heart.play("empty")

		"blinkMax":
			heart.play("whole")

	refresh_hearts()

	if displayed_health != character_body_2d.health:
		advance_health_step()
