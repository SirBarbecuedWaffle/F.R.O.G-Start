extends ColorRect
@onready var party_1: Sprite2D = $Party1
@onready var party_2: Sprite2D = $Party2
@onready var party_3: Sprite2D = $Party3
@onready var party_4: Sprite2D = $Party4
@onready var frog_box: Sprite2D = $frogBox
@onready var steve_box: Sprite2D = $steveBox
@onready var mask_box: Sprite2D = $maskBox
@onready var hood_box: Sprite2D = $hoodBox
@onready var robot_box: Sprite2D = $robotBox
@onready var gorf_box: Sprite2D = $gorfBox
@onready var barrel_box: Sprite2D = $barrelBox
@onready var lizard_box: Sprite2D = $lizardBox
@onready var fox_box: Sprite2D = $foxBox
@onready var joe_box: Sprite2D = $joeBox
@onready var party_count: Label = $partyCount
@onready var steve_lock: Sprite2D = $steveBox/steveLock
@onready var steve_anim: AnimatedSprite2D = $steveBox/steveAnim
@onready var mask_lock: Sprite2D = $maskBox/maskLock
@onready var mask_anim: AnimatedSprite2D = $maskBox/maskAnim
@onready var hood_lock: Sprite2D = $hoodBox/hoodLock
@onready var hood_anim: AnimatedSprite2D = $hoodBox/hoodAnim
@onready var robot_lock: Sprite2D = $robotBox/robotLock
@onready var robot_anim: AnimatedSprite2D = $robotBox/robotAnim
@onready var gorf_lock: Sprite2D = $gorfBox/gorfLock
@onready var gorf: AnimatedSprite2D = $gorfBox/gorf
@onready var barrel_lock: Sprite2D = $barrelBox/barrelLock
@onready var barrel_anim: AnimatedSprite2D = $barrelBox/barrelAnim
@onready var lizard_lock: Sprite2D = $lizardBox/lizardLock
@onready var lizard_anim: AnimatedSprite2D = $lizardBox/lizardAnim
@onready var fox_lock: Sprite2D = $foxBox/foxLock
@onready var fox_anim: AnimatedSprite2D = $foxBox/foxAnim
@onready var joe_lock: Sprite2D = $joeBox/joeLock
@onready var joe_anim: AnimatedSprite2D = $joeBox/joeAnim
@onready var name_label: Label = $MenuBox2/nameLabel
@onready var descript_label: Label = $MenuBox2/descriptLabel
@onready var tutdesc_lab: Label = $MenuBox2/tutdescLab
@onready var movetut_lab: Label = $MenuBox/movetutLab
@onready var move_displayer: Node2D = $MenuBox/moveDisplayer
var glitchedChars=["$","#",":D","%","1","ERROR","*","!"]
var focusedChar:=""

func _ready() -> void:
	updateParty()

func _process(delta: float) -> void:
	pass

func getChar()->String:
	return focusedChar

func updateLabel()->void:
	if focusedChar=="":
		await get_tree().create_timer(0.2).timeout
		if focusedChar=="":
			name_label.visible=false
			descript_label.visible=false
			tutdesc_lab.visible=true
			movetut_lab.visible=true
			move_displayer.visible=false
	else:		
		name_label.visible=true
		descript_label.visible=true
		tutdesc_lab.visible=false
		movetut_lab.visible=false
		move_displayer.visible=true
	if focusedChar=="frog":
		name_label.text="Name: Edward Von Frog"
		descript_label.text="Description: A frog with anger issues that knows martial arts and hates Christmas."
	if focusedChar=="steve":
		name_label.text="Name: Spaceman Steve"
		descript_label.text="Description: A hacker from space. On the run from the space cops after hacking a space millionare."
	if focusedChar=="mask":
		name_label.text="Name: Mask Dude"
		descript_label.text="Description: Nobody knows if he is wearing a mask or is the mask. Regardless, he knows voodoo."
	if focusedChar=="hood":
		name_label.text="Name: Flipper the Human"
		descript_label.text="Description: Likes to have fun with his brother, Jacob the Canine, and is in love with Princess Candy."
	if focusedChar=="robot":
		name_label.text="Name: IDFK, Hes a robot"
		descript_label.text="Description: A defective robot from a mega corporation. It's learning what its like to live."
	if focusedChar=="joe":
		name_label.text="Name: Average Joe"
		descript_label.text="Description: He doesn't want to be here any more than you do.      Mondays, am I right?"
	if focusedChar=="fox":
		name_label.text="Name: The Quick Brown Fox"
		descript_label.text="Description: It jumped over the lazy dog.            Loves sleeping and gambling."
	if focusedChar=="lizard":
		name_label.text="Name: Lizard?"
		descript_label.text="Description: Its probably a lizard? Scientists aren't really sure, but it can shoot fireballs."
	if focusedChar=="barrel":
		name_label.text="Name: Literally Just A Barrel"
		descript_label.text="Description: A barrel with a surprising amount of empathy. It loves healing, but hates fights."
	if focusedChar=="locked":
		name_label.text="Name: LOCKED"
		descript_label.text="Description: LOCKED"

func updateParty()->void:
	if CManager.charUnlocked[1]==1:
		steve_lock.visible=false
		steve_anim.visible=true
	if CManager.charUnlocked[2]==1:
		mask_lock.visible=false
		mask_anim.visible=true
	if CManager.charUnlocked[3]==1:
		hood_lock.visible=false
		hood_anim.visible=true
	if CManager.charUnlocked[4]==1:
		robot_lock.visible=false
		robot_anim.visible=true
	if CManager.charUnlocked[5]==1:
		joe_lock.visible=false
		joe_anim.visible=true
	if CManager.charUnlocked[6]==1:
		fox_lock.visible=false
		fox_anim.visible=true
	if CManager.charUnlocked[7]==1:
		lizard_lock.visible=false
		lizard_anim.visible=true
	if CManager.charUnlocked[8]==1:
		barrel_lock.visible=false
		barrel_anim.visible=true
	if CManager.charUnlocked[9]==1:
		gorf_lock.visible=false
		gorf.visible=true
		
		
	if CManager.party[0]!=0:
		party_1.visible=true
	else:
		party_1.visible=false
	if CManager.party[0]==1:
		party_1.global_position.x=frog_box.global_position.x
		party_1.global_position.y=frog_box.global_position.y-3
	if CManager.party[0]==2:
		party_1.global_position.x=steve_box.global_position.x
		party_1.global_position.y=steve_box.global_position.y-3
	if CManager.party[0]==3:
		party_1.global_position.x=mask_box.global_position.x
		party_1.global_position.y=mask_box.global_position.y-3
	if CManager.party[0]==4:
		party_1.global_position.x=hood_box.global_position.x
		party_1.global_position.y=hood_box.global_position.y-3
	if CManager.party[0]==5:
		party_1.global_position.x=robot_box.global_position.x
		party_1.global_position.y=robot_box.global_position.y-3
	if CManager.party[0]==6:
		party_1.global_position.x=joe_box.global_position.x
		party_1.global_position.y=joe_box.global_position.y-3
	if CManager.party[0]==7:
		party_1.global_position.x=fox_box.global_position.x
		party_1.global_position.y=fox_box.global_position.y-3
	if CManager.party[0]==8:
		party_1.global_position.x=lizard_box.global_position.x
		party_1.global_position.y=lizard_box.global_position.y-3
	if CManager.party[0]==9:
		party_1.global_position.x=barrel_box.global_position.x
		party_1.global_position.y=barrel_box.global_position.y-3
	if CManager.party[0]==10:
		party_1.global_position.x=gorf_box.global_position.x
		party_1.global_position.y=gorf_box.global_position.y-3
	
	
	if CManager.party[1]!=0:
		party_2.visible=true
	else:
		party_2.visible=false
	if CManager.party[1]==1:
		party_2.global_position.x=frog_box.global_position.x
		party_2.global_position.y=frog_box.global_position.y-3
	if CManager.party[1]==2:
		party_2.global_position.x=steve_box.global_position.x
		party_2.global_position.y=steve_box.global_position.y-3
	if CManager.party[1]==3:
		party_2.global_position.x=mask_box.global_position.x
		party_2.global_position.y=mask_box.global_position.y-3
	if CManager.party[1]==4:
		party_2.global_position.x=hood_box.global_position.x
		party_2.global_position.y=hood_box.global_position.y-3
	if CManager.party[1]==5:
		party_2.global_position.x=robot_box.global_position.x
		party_2.global_position.y=robot_box.global_position.y-3
	if CManager.party[1]==6:
		party_2.global_position.x=joe_box.global_position.x
		party_2.global_position.y=joe_box.global_position.y-3
	if CManager.party[1]==7:
		party_2.global_position.x=fox_box.global_position.x
		party_2.global_position.y=fox_box.global_position.y-3
	if CManager.party[1]==8:
		party_2.global_position.x=lizard_box.global_position.x
		party_2.global_position.y=lizard_box.global_position.y-3
	if CManager.party[1]==9:
		party_2.global_position.x=barrel_box.global_position.x
		party_2.global_position.y=barrel_box.global_position.y-3
	if CManager.party[1]==10:
		party_2.global_position.x=gorf_box.global_position.x
		party_2.global_position.y=gorf_box.global_position.y-3
	
	
	if CManager.party[2]!=0:
		party_3.visible=true
	else:
		party_3.visible=false
	if CManager.party[2]==1:
		party_3.global_position.x=frog_box.global_position.x
		party_3.global_position.y=frog_box.global_position.y-3
	if CManager.party[2]==2:
		party_3.global_position.x=steve_box.global_position.x
		party_3.global_position.y=steve_box.global_position.y-3
	if CManager.party[2]==3:
		party_3.global_position.x=mask_box.global_position.x
		party_3.global_position.y=mask_box.global_position.y-3
	if CManager.party[2]==4:
		party_3.global_position.x=hood_box.global_position.x
		party_3.global_position.y=hood_box.global_position.y-3
	if CManager.party[2]==5:
		party_3.global_position.x=robot_box.global_position.x
		party_3.global_position.y=robot_box.global_position.y-3
	if CManager.party[2]==6:
		party_3.global_position.x=joe_box.global_position.x
		party_3.global_position.y=joe_box.global_position.y-3
	if CManager.party[2]==7:
		party_3.global_position.x=fox_box.global_position.x
		party_3.global_position.y=fox_box.global_position.y-3
	if CManager.party[2]==8:
		party_3.global_position.x=lizard_box.global_position.x
		party_3.global_position.y=lizard_box.global_position.y-3
	if CManager.party[2]==9:
		party_3.global_position.x=barrel_box.global_position.x
		party_3.global_position.y=barrel_box.global_position.y-3
	if CManager.party[2]==10:
		party_3.global_position.x=gorf_box.global_position.x
		party_3.global_position.y=gorf_box.global_position.y-3
	
	
	if CManager.party[3]!=0:
		party_4.visible=true
	else:
		party_4.visible=false
	if CManager.party[3]==1:
		party_4.global_position.x=frog_box.global_position.x
		party_4.global_position.y=frog_box.global_position.y-3
	if CManager.party[3]==2:
		party_4.global_position.x=steve_box.global_position.x
		party_4.global_position.y=steve_box.global_position.y-3
	if CManager.party[3]==3:
		party_4.global_position.x=mask_box.global_position.x
		party_4.global_position.y=mask_box.global_position.y-3
	if CManager.party[3]==4:
		party_4.global_position.x=hood_box.global_position.x
		party_4.global_position.y=hood_box.global_position.y-3
	if CManager.party[3]==5:
		party_4.global_position.x=robot_box.global_position.x
		party_4.global_position.y=robot_box.global_position.y-3
	if CManager.party[3]==6:
		party_4.global_position.x=joe_box.global_position.x
		party_4.global_position.y=joe_box.global_position.y-3
	if CManager.party[3]==7:
		party_4.global_position.x=fox_box.global_position.x
		party_4.global_position.y=fox_box.global_position.y-3
	if CManager.party[3]==8:
		party_4.global_position.x=lizard_box.global_position.x
		party_4.global_position.y=lizard_box.global_position.y-3
	if CManager.party[3]==9:
		party_4.global_position.x=barrel_box.global_position.x
		party_4.global_position.y=barrel_box.global_position.y-3
	if CManager.party[3]==10:
		party_4.global_position.x=gorf_box.global_position.x
		party_4.global_position.y=gorf_box.global_position.y-3
	
	var count:=0
	for i in range(4):
		if CManager.party[i]!=0:
			count+=1
	party_count.text="PARTY SIZE: "+str(count)+"/4"

func _on_frog_button_pressed() -> void:
	var detected:=false
	for i in range(4):
		if CManager.party[i]==1:
			CManager.party[i]=0
			detected=true
			if CManager.party==[0,0,0,0]:
				CManager.party[i]=1
	if !detected:
		for i in range(4):
			if CManager.party[i]==0:
				CManager.party[i]=1
				break
	
	updateParty()

func _on_steve_button_pressed() -> void:
	if CManager.charUnlocked[1]==1:
		var detected:=false
		for i in range(4):
			if CManager.party[i]==2:
				CManager.party[i]=0
				detected=true
				if CManager.party==[0,0,0,0]:
					CManager.party[i]=2
		if !detected:
			for i in range(4):
				if CManager.party[i]==0:
					CManager.party[i]=2
					break
	
		updateParty()


func _on_mask_button_pressed() -> void:
	if CManager.charUnlocked[2]==1:
		var detected:=false
		for i in range(4):
			if CManager.party[i]==3:
				CManager.party[i]=0
				detected=true
				if CManager.party==[0,0,0,0]:
					CManager.party[i]=3
		if !detected:
			for i in range(4):
				if CManager.party[i]==0:
					CManager.party[i]=3
					break
		
		updateParty()


func _on_hood_button_pressed() -> void:
	if CManager.charUnlocked[3]==1:
		var detected:=false
		for i in range(4):
			if CManager.party[i]==4:
				CManager.party[i]=0
				detected=true
				if CManager.party==[0,0,0,0]:
					CManager.party[i]=4
		if !detected:
			for i in range(4):
				if CManager.party[i]==0:
					CManager.party[i]=4
					break
		
		updateParty()


func _on_robot_button_pressed() -> void:
	if CManager.charUnlocked[4]==1:
		var detected:=false
		for i in range(4):
			if CManager.party[i]==5:
				CManager.party[i]=0
				detected=true
				if CManager.party==[0,0,0,0]:
					CManager.party[i]=5
		if !detected:
			for i in range(4):
				if CManager.party[i]==0:
					CManager.party[i]=5
					break
		
		updateParty()


func _on_gorf_button_pressed() -> void:
	if CManager.charUnlocked[9]==1:
		var detected:=false
		for i in range(4):
			if CManager.party[i]==10:
				CManager.party[i]=0
				detected=true
				if CManager.party==[0,0,0,0]:
					CManager.party[i]=10
		if !detected:
			for i in range(4):
				if CManager.party[i]==0:
					CManager.party[i]=10
					break
		
		updateParty()


func _on_barrel_button_pressed() -> void:
	if CManager.charUnlocked[8]==1:
		var detected:=false
		for i in range(4):
			if CManager.party[i]==9:
				CManager.party[i]=0
				detected=true
				if CManager.party==[0,0,0,0]:
					CManager.party[i]=9
		if !detected:
			for i in range(4):
				if CManager.party[i]==0:
					CManager.party[i]=9
					break
		
		updateParty()


func _on_lizard_button_pressed() -> void:
	if CManager.charUnlocked[7]==1:
		var detected:=false
		for i in range(4):
			if CManager.party[i]==8:
				CManager.party[i]=0
				detected=true
				if CManager.party==[0,0,0,0]:
					CManager.party[i]=8
		if !detected:
			for i in range(4):
				if CManager.party[i]==0:
					CManager.party[i]=8
					break
		
		updateParty()


func _on_fox_button_pressed() -> void:
	if CManager.charUnlocked[6]==1:
		var detected:=false
		for i in range(4):
			if CManager.party[i]==7:
				CManager.party[i]=0
				detected=true
				if CManager.party==[0,0,0,0]:
					CManager.party[i]=7
		if !detected:
			for i in range(4):
				if CManager.party[i]==0:
					CManager.party[i]=7
					break
		
		updateParty()


func _on_joe_button_pressed() -> void:
	if CManager.charUnlocked[5]==1:
		var detected:=false
		for i in range(4):
			if CManager.party[i]==6:
				CManager.party[i]=0
				detected=true
				if CManager.party==[0,0,0,0]:
					CManager.party[i]=6
		if !detected:
			for i in range(4):
				if CManager.party[i]==0:
					CManager.party[i]=6
					break
		
		updateParty()


func _on_frog_button_mouse_entered() -> void:
	focusedChar="frog"
	updateLabel()


func _on_frog_button_mouse_exited() -> void:
	#focusedChar=""
	#updateLabel()
	pass


func _on_steve_button_mouse_entered() -> void:
	if CManager.charUnlocked[1]==1:
		focusedChar="steve"
		updateLabel()
	else:
		focusedChar="locked"
		updateLabel()

func _on_mask_button_mouse_entered() -> void:
	if CManager.charUnlocked[2]==1:
		focusedChar="mask"
		updateLabel()
	else:
		focusedChar="locked"
		updateLabel()

func _on_hood_button_mouse_entered() -> void:
	if CManager.charUnlocked[3]==1:
		focusedChar="hood"
		updateLabel()
	else:
		focusedChar="locked"
		updateLabel()

func _on_robot_button_mouse_entered() -> void:
	if CManager.charUnlocked[4]==1:
		focusedChar="robot"
		updateLabel()
	else:
		focusedChar="locked"
		updateLabel()

func _on_gorf_button_mouse_entered() -> void:
	if CManager.charUnlocked[9]==1:
		focusedChar="gorF"
		updateLabel()
	else:
		focusedChar="locked"
		updateLabel()

func _on_barrel_button_mouse_entered() -> void:
	if CManager.charUnlocked[8]==1:
		focusedChar="barrel"
		updateLabel()
	else:
		focusedChar="locked"
		updateLabel()
func _on_lizard_button_mouse_entered() -> void:
	if CManager.charUnlocked[7]==1:
		focusedChar="lizard"
		updateLabel()
	else:
		focusedChar="locked"
		updateLabel()
func _on_fox_button_mouse_entered() -> void:
	if CManager.charUnlocked[6]==1:
		focusedChar="fox"
		updateLabel()
	else:
		focusedChar="locked"
		updateLabel()

func _on_joe_button_mouse_entered() -> void:
	if CManager.charUnlocked[5]==1:
		focusedChar="joe"
		updateLabel()
	else:
		focusedChar="locked"
		updateLabel()


func _on_glitch_timer_timeout() -> void:
	if focusedChar=="gorF":
		name_label.text="Name: gorF noV drawdE"
		descript_label.text="Description: samtsirhC setah dna stra laitram swonk taht seussi regna htiw grof A"		
		for i in range(10):
			var scramble=randi_range(0,descript_label.text.length()-1)
			descript_label.text[scramble]=glitchedChars[randi_range(0,glitchedChars.size()-1)]
			var scramble2=randi_range(0,name_label.text.length()-1)
			name_label.text[scramble2]=glitchedChars[randi_range(0,glitchedChars.size()-1)]
	
