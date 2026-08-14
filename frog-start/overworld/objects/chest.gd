extends Node2D
@onready var closedb: Sprite2D = $closedb
@onready var openb: Sprite2D = $openb
@onready var closedg: Sprite2D = $closedg
@onready var openg: Sprite2D = $openg
@onready var closedr: Sprite2D = $closedr
@onready var openr: Sprite2D = $openr
@onready var closedp: Sprite2D = $closedp
@onready var openp: Sprite2D = $openp
@export var patchHeld:=0
@export var itemType:="patch"
var canOpen:=0
var playbody : CharacterBody2D = null
func _ready() -> void:
	if patchHeld<9:
		closedb.visible=true
	elif patchHeld<21:
		closedg.visible=true
		closedb.visible=false
	else:
		closedr.visible=true
	if patchHeld==8 || patchHeld==6 || patchHeld==7 || patchHeld==16 || patchHeld==17 || patchHeld==18 || patchHeld==28 || patchHeld==26 || patchHeld==27:
		closedp.visible=true
		closedb.visible=false
		closedg.visible=false
		closedr.visible=false
	if CManager.patchesUnlocked[patchHeld-1]==1:
		if closedb.visible:
			openb.visible=true
		if closedg.visible:
			openg.visible=true
		if closedr.visible:
			openr.visible=true
		if closedp.visible:
			openp.visible=true

func _input(event):
	if Input.is_action_just_pressed("space"):
		if CManager.patchesUnlocked[canOpen-1]==0 && canOpen==patchHeld:
			playbody.itemCollect(patchHeld)
			if closedb.visible:
				openb.visible=true
			if closedg.visible:
				openg.visible=true
			if closedr.visible:
				openr.visible=true
			if closedp.visible:
				openp.visible=true
			canOpen=false
			CManager.patchesUnlocked[patchHeld-1]=1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if openb.visible==false || openg.visible==false || openr.visible==false || openp.visible==false:
		canOpen=patchHeld
		playbody=body


func _on_area_2d_body_exited(body: Node2D) -> void:
	canOpen=0
