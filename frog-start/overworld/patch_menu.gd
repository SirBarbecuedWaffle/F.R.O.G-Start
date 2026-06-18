extends ColorRect
@onready var frog_box: Sprite2D = $partyRep/frogBox
@onready var frog_box_2: Sprite2D = $partyRep/frogBox2
@onready var frog_box_3: Sprite2D = $partyRep/frogBox3
@onready var frog_box_4: Sprite2D = $partyRep/frogBox4
@onready var boxback_1: ColorRect = $partyRep/frogBox/boxback1
@onready var boxback_2: ColorRect = $partyRep/frogBox2/boxback2
@onready var boxback_3: ColorRect = $partyRep/frogBox3/boxback3
@onready var boxback_4: ColorRect = $partyRep/frogBox4/boxback4

@onready var patch_menu: ColorRect = $"."
var patchHoved:=0
var patchGrabbed:=0
var dropOnParty:=0
var curPicked: Node2D =null	
@onready var box_1_vis: Node2D = $row1/box1/box1Vis
@onready var box_2_vis: Node2D = $row1/box2/box2Vis
@onready var box_3_vis: Node2D = $row1/box3/box3Vis
@onready var box_4_vis: Node2D = $row1/box4/box4Vis
@onready var box_5_vis: Node2D = $row1/box5/box5Vis
@onready var box_6_vis: Node2D = $row1/box6/box6Vis
@onready var box_7_vis: Node2D = $row1/box7/box7Vis
@onready var box_8_vis: Node2D = $row1/box8/box8Vis
@onready var box_9_vis: Node2D = $row1/box9/box9Vis
@onready var box_10_vis: Node2D = $row1/box10/box10Vis
@onready var box_11_vis: Node2D = $row2/box11/box11Vis
@onready var box_12_vis: Node2D = $row2/box12/box12Vis
@onready var box_13_vis: Node2D = $row2/box13/box13Vis
@onready var box_14_vis: Node2D = $row2/box14/box14Vis
@onready var box_15_vis: Node2D = $row2/box15/box15Vis
@onready var box_16_vis: Node2D = $row2/box16/box16Vis
@onready var box_17_vis: Node2D = $row2/box17/box17Vis
@onready var box_18_vis: Node2D = $row2/box18/box18Vis
@onready var box_19_vis: Node2D = $row2/box19/box19Vis
@onready var box_20_vis: Node2D = $row2/box20/box20Vis
@onready var box_21_vis: Node2D = $row3/box21/box21Vis
@onready var box_22_vis: Node2D = $row3/box22/box22Vis
@onready var box_23_vis: Node2D = $row3/box23/box23Vis
@onready var box_24_vis: Node2D = $row3/box24/box24Vis
@onready var box_25_vis: Node2D = $row3/box25/box25Vis
@onready var box_26_vis: Node2D = $row3/box26/box26Vis
@onready var box_27_vis: Node2D = $row3/box27/box27Vis
@onready var box_28_vis: Node2D = $row3/box28/box28Vis
@onready var box_29_vis: Node2D = $row3/box29/box29Vis
@onready var box_30_vis: Node2D = $row3/box30/box30Vis

func updateParty()->void:
	box_1_vis.position=Vector2.ZERO
	box_2_vis.position=Vector2.ZERO
	box_3_vis.position=Vector2.ZERO
	box_4_vis.position=Vector2.ZERO
	box_5_vis.position=Vector2.ZERO
	box_6_vis.position=Vector2.ZERO
	box_7_vis.position=Vector2.ZERO
	box_8_vis.position=Vector2.ZERO
	box_9_vis.position=Vector2.ZERO
	box_10_vis.position=Vector2.ZERO
	box_11_vis.position=Vector2.ZERO
	box_12_vis.position=Vector2.ZERO
	box_13_vis.position=Vector2.ZERO
	box_14_vis.position=Vector2.ZERO
	box_15_vis.position=Vector2.ZERO
	box_16_vis.position=Vector2.ZERO
	box_17_vis.position=Vector2.ZERO
	box_18_vis.position=Vector2.ZERO
	box_19_vis.position=Vector2.ZERO
	box_20_vis.position=Vector2.ZERO
	box_21_vis.position=Vector2.ZERO
	box_22_vis.position=Vector2.ZERO
	box_23_vis.position=Vector2.ZERO
	box_24_vis.position=Vector2.ZERO
	box_25_vis.position=Vector2.ZERO
	box_26_vis.position=Vector2.ZERO
	box_27_vis.position=Vector2.ZERO
	box_28_vis.position=Vector2.ZERO
	box_29_vis.position=Vector2.ZERO
	box_30_vis.position=Vector2.ZERO
	
	
	for i in range(4):
		var guy : Sprite2D=null
		if i==0:
			guy=frog_box	
		if i==1:
			guy=frog_box_2
		if i==2:
			guy=frog_box_3
		if i==3:
			guy=frog_box_4
		guy.get_children()[0].color=Color(0.0, 0.0, 0.0, 0.0)
		if CManager.currentPatches[i]!=0:			
			guy.get_children()[0].color=Color(0.0, 0.0, 0.0, 0.482)
			if CManager.currentPatches[i]==1:
				box_1_vis.global_position=guy.global_position
				box_1_vis.z_index=2
			if CManager.currentPatches[i]==2:
				box_2_vis.global_position=guy.global_position
				box_2_vis.z_index=2
			if CManager.currentPatches[i]==3:
				box_3_vis.global_position=guy.global_position
				box_3_vis.z_index=2
			if CManager.currentPatches[i]==4:
				box_4_vis.global_position=guy.global_position
				box_4_vis.z_index=2
			if CManager.currentPatches[i]==5:
				box_5_vis.global_position=guy.global_position
				box_5_vis.z_index=2
			if CManager.currentPatches[i]==6:
				box_6_vis.global_position=guy.global_position
				box_6_vis.z_index=2
			if CManager.currentPatches[i]==7:
				box_7_vis.global_position=guy.global_position
				box_7_vis.z_index=2
			if CManager.currentPatches[i]==8:
				box_8_vis.global_position=guy.global_position
				box_8_vis.z_index=2
			if CManager.currentPatches[i]==9:
				box_9_vis.global_position=guy.global_position
				box_9_vis.z_index=2
			if CManager.currentPatches[i]==10:
				box_10_vis.global_position=guy.global_position
				box_10_vis.z_index=2
			if CManager.currentPatches[i]==11:
				box_11_vis.global_position=guy.global_position
				box_11_vis.z_index=2
			if CManager.currentPatches[i]==12:
				box_12_vis.global_position=guy.global_position
				box_12_vis.z_index=2
			if CManager.currentPatches[i]==13:
				box_13_vis.global_position=guy.global_position
				box_13_vis.z_index=2
			if CManager.currentPatches[i]==14:
				box_14_vis.global_position=guy.global_position
				box_14_vis.z_index=2
			if CManager.currentPatches[i]==15:
				box_15_vis.global_position=guy.global_position
				box_15_vis.z_index=2
			if CManager.currentPatches[i]==16:
				box_16_vis.global_position=guy.global_position
				box_16_vis.z_index=2
			if CManager.currentPatches[i]==17:
				box_17_vis.global_position=guy.global_position
				box_17_vis.z_index=2
			if CManager.currentPatches[i]==18:
				box_18_vis.global_position=guy.global_position
				box_18_vis.z_index=2
			if CManager.currentPatches[i]==19:
				box_19_vis.global_position=guy.global_position
				box_19_vis.z_index=2
			if CManager.currentPatches[i]==20:
				box_20_vis.global_position=guy.global_position
				box_20_vis.z_index=2
			if CManager.currentPatches[i]==21:
				box_21_vis.global_position=guy.global_position
				box_21_vis.z_index=2
			if CManager.currentPatches[i]==22:
				box_22_vis.global_position=guy.global_position
				box_22_vis.z_index=2
			if CManager.currentPatches[i]==23:
				box_23_vis.global_position=guy.global_position
				box_23_vis.z_index=2
			if CManager.currentPatches[i]==24:
				box_24_vis.global_position=guy.global_position
				box_24_vis.z_index=2
			if CManager.currentPatches[i]==25:
				box_25_vis.global_position=guy.global_position
				box_25_vis.z_index=2
			if CManager.currentPatches[i]==26:
				box_26_vis.global_position=guy.global_position
				box_26_vis.z_index=2
			if CManager.currentPatches[i]==27:
				box_27_vis.global_position=guy.global_position
				box_27_vis.z_index=2
			if CManager.currentPatches[i]==28:
				box_28_vis.global_position=guy.global_position
				box_28_vis.z_index=2
			if CManager.currentPatches[i]==29:
				box_29_vis.global_position=guy.global_position
				box_29_vis.z_index=2
			if CManager.currentPatches[i]==30:
				box_30_vis.global_position=guy.global_position
				box_30_vis.z_index=2
	for f in patch_menu.get_children():
		for d in f.get_children():
			if d!=null:
				for g in d.get_children():
					if g!=null:
						for m in g.get_children():
							if m!=null:
								if m is Button:
									m.connect("mouse_exited",_on_frog_button_mouse_exited)

func _ready() -> void:
	updateParty()

func _process(delta: float) -> void:
	print(CManager.currentPatches)
	if curPicked!=null:
		curPicked.z_index=3
	if patchHoved==1:
		curPicked=box_1_vis
	if patchHoved==2:
		curPicked=box_2_vis
	if patchHoved==3:
		curPicked=box_3_vis
	if patchHoved==4:
		curPicked=box_4_vis
	if patchHoved==5:
		curPicked=box_5_vis
	if patchHoved==6:
		curPicked=box_6_vis
	if patchHoved==7:
		curPicked=box_7_vis
	if patchHoved==8:
		curPicked=box_8_vis
	if patchHoved==9:
		curPicked=box_9_vis
	if patchHoved==10:
		curPicked=box_10_vis
	if patchHoved==11:
		curPicked=box_11_vis
	if patchHoved==12:
		curPicked=box_12_vis
	if patchHoved==13:
		curPicked=box_13_vis
	if patchHoved==14:
		curPicked=box_14_vis
	if patchHoved==15:
		curPicked=box_15_vis
	if patchHoved==16:
		curPicked=box_16_vis
	if patchHoved==17:
		curPicked=box_17_vis
	if patchHoved==18:
		curPicked=box_18_vis
	if patchHoved==19:
		curPicked=box_19_vis
	if patchHoved==20:
		curPicked=box_20_vis
	if patchHoved==21:
		curPicked=box_21_vis
	if patchHoved==22:
		curPicked=box_22_vis
	if patchHoved==23:
		curPicked=box_23_vis
	if patchHoved==24:
		curPicked=box_24_vis
	if patchHoved==25:
		curPicked=box_25_vis
	if patchHoved==26:
		curPicked=box_26_vis
	if patchHoved==27:
		curPicked=box_27_vis
	if patchHoved==28:
		curPicked=box_28_vis
	if patchHoved==29:
		curPicked=box_29_vis
	if patchHoved==30:
		curPicked=box_30_vis

	if Input.is_action_pressed("lClick"):
		if dropOnParty==1:
			if CManager.currentPatches[0]!=0 && patchGrabbed==0:
				if CManager.currentPatches[0]==1:
					curPicked=box_1_vis
					patchGrabbed=1
				if CManager.currentPatches[0]==2:
					curPicked=box_2_vis
					patchGrabbed=2
				if CManager.currentPatches[0]==3:
					curPicked=box_3_vis
					patchGrabbed=3
				if CManager.currentPatches[0]==4:
					curPicked=box_4_vis
					patchGrabbed=4
				if CManager.currentPatches[0]==5:
					curPicked=box_5_vis
					patchGrabbed=5
				if CManager.currentPatches[0]==6:
					curPicked=box_6_vis
					patchGrabbed=6
				if CManager.currentPatches[0]==7:
					curPicked=box_7_vis
					patchGrabbed=7
				if CManager.currentPatches[0]==8:
					curPicked=box_8_vis
					patchGrabbed=8
				if CManager.currentPatches[0]==9:
					curPicked=box_9_vis
					patchGrabbed=9
				if CManager.currentPatches[0]==10:
					curPicked=box_10_vis
					patchGrabbed=10
				if CManager.currentPatches[0]==11:
					curPicked=box_11_vis
					patchGrabbed=11
				if CManager.currentPatches[0]==12:
					curPicked=box_12_vis
					patchGrabbed=12
				if CManager.currentPatches[0]==13:
					curPicked=box_13_vis
					patchGrabbed=13
				if CManager.currentPatches[0]==14:
					curPicked=box_14_vis
					patchGrabbed=14
				if CManager.currentPatches[0]==15:
					curPicked=box_15_vis
					patchGrabbed=15
				if CManager.currentPatches[0]==16:
					curPicked=box_16_vis
					patchGrabbed=16
				if CManager.currentPatches[0]==17:
					curPicked=box_17_vis
					patchGrabbed=17
				if CManager.currentPatches[0]==18:
					curPicked=box_18_vis
					patchGrabbed=18
				if CManager.currentPatches[0]==19:
					curPicked=box_19_vis
					patchGrabbed=19
				if CManager.currentPatches[0]==20:
					curPicked=box_20_vis
					patchGrabbed=20
				if CManager.currentPatches[0]==21:
					curPicked=box_21_vis
					patchGrabbed=21
				if CManager.currentPatches[0]==22:
					curPicked=box_22_vis
					patchGrabbed=22
				if CManager.currentPatches[0]==23:
					curPicked=box_23_vis
					patchGrabbed=23
				if CManager.currentPatches[0]==24:
					curPicked=box_24_vis
					patchGrabbed=24
				if CManager.currentPatches[0]==25:
					curPicked=box_25_vis
					patchGrabbed=25
				if CManager.currentPatches[0]==26:
					curPicked=box_26_vis
					patchGrabbed=26
				if CManager.currentPatches[0]==27:
					curPicked=box_27_vis
					patchGrabbed=27
				if CManager.currentPatches[0]==28:
					curPicked=box_28_vis
					patchGrabbed=28
				if CManager.currentPatches[0]==29:
					curPicked=box_29_vis
					patchGrabbed=29
				if CManager.currentPatches[0]==30:
					curPicked=box_30_vis
					patchGrabbed=30
				CManager.currentPatches[0]=0
				boxback_1.color=Color(0.0, 0.0, 0.0, 0.0)
		if curPicked!=null:
			if patchGrabbed==0:
				patchGrabbed=patchHoved
			curPicked.global_position=get_global_mouse_position()
		
	else:
		if curPicked!=null:
			if dropOnParty==0:
				curPicked.position=Vector2.ZERO
				curPicked=null
			if dropOnParty==1:
				curPicked.global_position=frog_box.position
				curPicked.z_index=2
				if CManager.currentPatches[0]==1:
					box_1_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==2:
					box_2_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==2:
					box_2_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==3:
					box_3_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==4:
					box_4_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==5:
					box_5_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==6:
					box_6_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==7:
					box_7_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==8:
					box_8_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==9:
					box_9_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==10:
					box_10_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==11:
					box_11_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==12:
					box_12_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==13:
					box_13_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==14:
					box_14_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==15:
					box_15_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==16:
					box_16_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==17:
					box_17_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==18:
					box_18_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==19:
					box_19_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==20:
					box_20_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==21:
					box_21_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==22:
					box_22_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==23:
					box_23_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==24:
					box_24_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==25:
					box_25_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==26:
					box_26_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==27:
					box_27_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==28:
					box_28_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==29:
					box_29_vis.position=Vector2.ZERO
				if CManager.currentPatches[0]==30:
					box_30_vis.position=Vector2.ZERO
				CManager.currentPatches[0]=patchGrabbed
				boxback_1.color=Color(0.0, 0.0, 0.0, 0.482)
				curPicked=null
		
		
		patchGrabbed=0



func _on_frog_button_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=1


func _on_frog_button_mouse_exited() -> void:
	patchHoved=0


func _on_boxback_1_mouse_entered() -> void:
	if CManager.party[0]!=10:
		dropOnParty=1


func _on_boxback_1_mouse_exited() -> void:
	dropOnParty=0


func _on_box_button_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=2


func _on_box_button_2_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=3


func _on_box_button_3_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=4


func _on_box_button_4_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=5


func _on_box_button_5_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=6


func _on_box_button_6_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=7


func _on_box_button_7_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=8


func _on_box_button_8_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=9


func _on_box_button_9_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=10


func _on_box_button_10_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=11


func _on_box_button_20_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=21


func _on_box_button_11_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=12


func _on_box_button_12_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=13


func _on_box_button_13_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=14


func _on_box_button_14_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=15


func _on_box_button_15_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=16


func _on_box_button_16_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=17


func _on_box_button_17_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=18


func _on_box_button_18_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=19


func _on_box_button_19_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=20


func _on_box_button_21_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=22


func _on_box_button_22_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=23


func _on_box_button_23_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=24


func _on_box_button_24_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=25


func _on_box_button_25_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=26


func _on_box_button_26_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=27


func _on_box_button_27_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=28


func _on_box_button_28_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=29


func _on_box_button_29_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=30
