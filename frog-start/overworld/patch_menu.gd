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
@onready var exp_box_name: Label = $hoverBox/expBoxName
@onready var exp_box_desc: RichTextLabel = $hoverBox/expBoxDesc
@onready var hover_box: Control = $hoverBox
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
var showGlitch:=false

var hovis:=0.0

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
	var boxes = [
	box_1_vis,
	box_2_vis,
	box_3_vis,
	box_4_vis,
	box_5_vis,
	box_6_vis,
	box_7_vis,
	box_8_vis,
	box_9_vis,
	box_10_vis,
	box_11_vis,
	box_12_vis,
	box_13_vis,
	box_14_vis,
	box_15_vis,
	box_16_vis,
	box_17_vis,
	box_18_vis,
	box_19_vis,
	box_20_vis,
	box_21_vis,
	box_22_vis,
	box_23_vis,
	box_24_vis,
	box_25_vis,
	box_26_vis,
	box_27_vis,
	box_28_vis,
	box_29_vis,
	box_30_vis
]
	var count:=0
	for f in boxes:
		f.modulate=Color(1.0, 1.0, 1.0, 1.0)
		if CManager.patchesUnlocked[count]==0:
			if f!=null:
				f.modulate=Color(0.0, 0.0, 0.0, 1.0)
		count+=1
	
	
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

func get_box_offset(mouse_x: float) -> float:
	if mouse_x <= 1013.5:
		return lerp(450.0, 600.0, inverse_lerp(1013.5, 1712.0, mouse_x))
		

	# Segment 2: 1013.5 → 1712  (offset 450 → 600)
	elif mouse_x <= 1712.0:
		return lerp(300.0, 450.0, inverse_lerp(315.0, 1013.5, mouse_x))
		
	return 600.0



func _ready() -> void:
	updateParty()

func _process(delta: float) -> void:

	if !hovis>0:
		exp_box_desc.text=""
	hover_box.visible=hovis>0
	if !Input.is_action_pressed("lClick"):
		if patchHoved!=0:
				if patchHoved==1:
					exp_box_name.text="Headstart: Defense"
					exp_box_desc.text="Applies 30 seconds of increased \ndefense to your entire party at the start of battle"
				if patchHoved==2:
					exp_box_name.text="Headstart: Strength"
					exp_box_desc.text="Applies 30 seconds of increased \nattack to your entire party at the start of battle"
				if patchHoved==3:
					exp_box_name.text="Headstart: Speed"
					exp_box_desc.text="Applies 30 seconds of increased \nspeed to your entire party at the start of battle"
				if patchHoved==4:
					exp_box_name.text="Second: Nature"
					exp_box_desc.text="Deals 20 damage to a randomly chosen enemy whenever this party member uses a move"
				if patchHoved==5:
					exp_box_name.text="Boost: Difficulty"
					exp_box_desc.text="Increases the amount of higher health enemies encountered, and increases boss health and speed"
				if patchHoved==6:
					exp_box_name.text="Protocol: Arrow"
					exp_box_desc.text="Every 6 seconds fires an arrow at a random enemy, afflicting a 3 second long status debuff or dealing 15 damage"
				if patchHoved==7:
					exp_box_name.text="Protocol: Alt F4"
					exp_box_desc.text="Every 20 seconds\nattempts to instakill a random non-boss enemy"
				if patchHoved==8:
					exp_box_name.text="Protocol: Curse"
					exp_box_desc.text="Every 25 seconds afflicts every enemy with decreased attack for 10 seconds"
				if patchHoved==9:
					exp_box_name.text="Boost: Health"
					exp_box_desc.text="Increases the max health of the party member with the patch equipped by 50%"
				if patchHoved==10:
					exp_box_name.text="Second: Chance"
					exp_box_desc.text="Once per fight, allows the party member with the patch equipped to automatically revive after death"
				if patchHoved==11:
					exp_box_name.text="Endless: Defense"
					exp_box_desc.text="Applies permanent increased defense to the party member with the patch equipped"
				if patchHoved==12:
					exp_box_name.text="Endless: Strength"
					exp_box_desc.text="Applies permanent increased strength to the party member with the patch equipped"
				if patchHoved==13:
					exp_box_name.text="Endless: Speed"
					exp_box_desc.text="Applies permanent increased speed to the party member with the patch equipped"
				if patchHoved==14:
					exp_box_name.text="Second: Wind"
					exp_box_desc.text="When the party member with the patch dies the rest of the party gets a massive boost\n\nThe party member with this patch equipped cannot be revived"
				if patchHoved==15:
					exp_box_name.text="Revenge: Fireball"
					exp_box_desc.text="Summons a fireball whenever an enemy gets killed\nDeals high singular damage and burns nearby enemies"
				if patchHoved==16:
					exp_box_name.text="Protocol: Sword"
					exp_box_desc.text="Every 2 seconds fires a sword that deals 10 damage to a random enemy"
				if patchHoved==17:
					exp_box_name.text="Protocol: Electrocute"
					exp_box_desc.text="Every 10 seconds electrocutes a random enemy stunning it for 3 seconds"
				if patchHoved==18:
					exp_box_name.text="Protocol: Caffeinate"
					exp_box_desc.text="Every 15 seconds fires a coffee mug that either heals a random member of your party for 100 health and raises their speed for 5 seconds or burns a random enemy for 100 damage"
				if patchHoved==19:
					exp_box_name.text="Revenge: Frogsicle"
					exp_box_desc.text="Summons healing frogsicles for your entire party whenever an enemy gets killed"
				if patchHoved==20:
					exp_box_name.text="Revenge: Smite"
					exp_box_desc.text="Smites a random enemy whenever an enemy gets killed\nDeals high singular damage and temporarily lowers their defense"
				if patchHoved==21:
					exp_box_name.text="Block: Cleaving"
					exp_box_desc.text="Stops your party from being killed at full health\nPrevents cleaving damage"
				if patchHoved==22:
					exp_box_name.text="Block: Stun"
					exp_box_desc.text="Prevents your party from being stunned\nReduces fire damage by 2"
				if patchHoved==23:
					exp_box_name.text="Block: Debuffs"
					exp_box_desc.text="Prevents your party from being afflicted with status debuffs"
				if patchHoved==24:
					exp_box_name.text="Counter: Strike"
					exp_box_desc.text="Automatically deals 100 damage to a random enemy\nTriggers whenever the party member with the patch equipped gets attacked"
				if patchHoved==25:
					exp_box_name.text="Counter: Pummel"
					exp_box_desc.text="Automatically deals 20 damage to two random enemies before dealing 75 damage to and decreasing the attack of a random enemy\nTriggers whenever the party member with the patch equipped gets attacked"
				if patchHoved==26:
					exp_box_name.text="Protocol: Gamble"
					exp_box_desc.text="Every 12 seconds rolls a dice, having a different effect based on the number rolled"
				if patchHoved==27:
					exp_box_name.text="Protocol: Pollute"
					exp_box_desc.text="Every 15 seconds targets a random enemy, afflicting poison and negative status effects for 5 seconds"
				if patchHoved==28:
					exp_box_name.text="Protocol: Hydrate"
					exp_box_desc.text="Every 20 seconds heals every member of your party for 75 health and applies a random positive status effect"
				if patchHoved==29:
					exp_box_name.text="Counter: Electrocute"
					exp_box_desc.text="Automatically burns and stuns a random enemy for 3 seconds\nTriggers whenever the party member with the patch equipped gets attacked"
				if patchHoved==30:
					exp_box_name.text="Boost: Experience"
					exp_box_desc.text="Doubles the experience gained by the party member with the patch equipped"
				hovis=1
				hover_box.global_position.x=get_global_mouse_position().x-get_box_offset(get_global_mouse_position().x)
				hover_box.global_position.y=get_global_mouse_position().y-724
		elif dropOnParty!=0 && CManager.currentPatches[dropOnParty-1]!=0:
				if CManager.currentPatches[dropOnParty-1]==1:
					exp_box_name.text="Headstart: Defense"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Applies 30 seconds of increased \ndefense to your entire party at the start of battle")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==5:
						exp_box_desc.push_color(Color(1.0, 0.9, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+150 health regen to your entire party at the start of battle")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==8:
						exp_box_desc.push_color(Color(0.4, 0.0, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+20 seconds of invincibility at the start of battle\n-30 seconds of increased defense")
						exp_box_desc.pop()
					
					
				if CManager.currentPatches[dropOnParty-1]==2:
					exp_box_name.text="Headstart: Strength"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Applies 30 seconds of increased \nattack to your entire party at the start of battle")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==1:
						exp_box_desc.push_color(Color(0.017, 1.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+5 seconds of increased speed at the start of battle")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==4:
						exp_box_desc.push_color(Color(1.0, 0.43, 0.972, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+30 seconds of increased attack\n+30 seconds of decreased speed at the start of battle")
						exp_box_desc.pop()
					
						
				if CManager.currentPatches[dropOnParty-1]==3:
					exp_box_name.text="Headstart: Speed"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Applies 30 seconds of increased \nspeed to your entire party at the start of battle")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==2:
						exp_box_desc.push_color(Color(0.0, 0.967, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+10 seconds of increased speed at the start of battle")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==7:
						exp_box_desc.push_color(Color(1.0, 0.683, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+30 seconds of increased speed\n+20 seconds of decreased defense at the start of battle")
					
				if CManager.currentPatches[dropOnParty-1]==4:
					exp_box_name.text="Second: Nature"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Deals 20 damage to a randomly chosen enemy whenever this party member uses a move")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==1:
						exp_box_desc.push_color(Color(0.017, 1.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+10 damage")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==2:
						exp_box_desc.push_color(Color(0.0, 0.967, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n-10 damage\n+20 poison damage")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==3:
						exp_box_desc.push_color(Color(1.0, 0.604, 0.12, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+7 seconds of decreased attack to enemy hit")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==4:
						exp_box_desc.push_color(Color(1.0, 0.43, 0.972, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n-20 damge\n+50 burn damage")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==5:
						exp_box_desc.push_color(Color(1.0, 0.9, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+5 burn damage\n+1 second of stun to enemy hit\n+3 seconds of decreased speed to enemy hit")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==6:
						exp_box_desc.push_color(Color(0.467, 0.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n-20 damage\n+40 burn damage\n+3 seconds of decreased defense to enemy hit")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==7:
						exp_box_desc.push_color(Color(1.0, 0.683, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+?? damage")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==8:
						exp_box_desc.push_color(Color(0.4, 0.0, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+20 burn damage\n+20 poison damage")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==9:
						exp_box_desc.push_color(Color(1.0, 0.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+50 damage\n+20 health regen to enemy hit")
						exp_box_desc.pop()

				if CManager.currentPatches[dropOnParty-1]==5:
					exp_box_name.text="Boost: Difficulty"
					exp_box_desc.text="Increases the amount of higher health enemies encountered, and increases boss health and speed"
				
				if CManager.currentPatches[dropOnParty-1]==6:
					exp_box_name.text="Protocol: Arrow"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Every 6 seconds fires an arrow at a random enemy, afflicting a status debuff or dealing medium damage")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==1:
						exp_box_desc.push_color(Color(0.017, 1.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n-33% cooldown")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==3:
						exp_box_desc.push_color(Color(1.0, 0.604, 0.12, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+1 arrow fired\n+66% cooldown")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==7:
					exp_box_name.text="Protocol: Alt F4"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Every 20 seconds\nattempts to instakill a random non-boss enemy")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==2:
						exp_box_desc.push_color(Color(0.0, 0.967, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n-20% cooldown\n+10% luck")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==6:
						exp_box_desc.push_color(Color(0.467, 0.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\nNow targets every enemy and afflicts burn if it fails\n+50% cooldown\n-40% luck")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==8:
					exp_box_name.text="Protocol: Curse"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Every 25 seconds afflicts every enemy with decreased attack for 10 seconds")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==3:
						exp_box_desc.push_color(Color(1.0, 0.604, 0.12, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\nWill randomize the status effect afflicted")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==8:
						exp_box_desc.push_color(Color(0.4, 0.0, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\nWill afflict decreased speed instead of attack\n+40 poison damage")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==10:
					exp_box_name.text="Second: Chance"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Once per fight, allows the party member with the patch equipped to automatically revive after death")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==9:
						exp_box_desc.push_color(Color(1.0, 0.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+200 health regen to every party member upon triggering")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==4:
						exp_box_desc.push_color(Color(1.0, 0.43, 0.972, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+120 burn damage to every enemy upon triggering")
						exp_box_desc.pop()
				
					
				if CManager.currentPatches[dropOnParty-1]==9:
					exp_box_name.text="Boost: Health"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Increases the max health of the party member with the patch equipped by 50%")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==7:
						exp_box_desc.push_color(Color(1.0, 0.683, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\nRandomizes the percent health increase")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==5:
						exp_box_desc.push_color(Color(1.0, 0.9, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+50% max health")
						exp_box_desc.pop()
				
				
				if CManager.currentPatches[dropOnParty-1]==11:
					exp_box_name.text="Endless: Defense"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Applies permanent increased defense to the party member with the patch equipped")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==6:
						exp_box_desc.push_color(Color(0.467, 0.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+20% Max Health")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==2:
						exp_box_desc.push_color(Color(0.0, 0.967, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+1 second of invicibility on move use")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==12:
					exp_box_name.text="Endless: Attack"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Applies permanent increased attack to the party member with the patch equipped")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==5:
						exp_box_desc.push_color(Color(1.0, 0.9, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+10 health on move use")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==4:
						exp_box_desc.push_color(Color(1.0, 0.43, 0.972, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+2 seconds of increased speed after move use")
						exp_box_desc.pop()
						
				if CManager.currentPatches[dropOnParty-1]==13:
					exp_box_name.text="Endless: Speed"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Applies permanent increased speed to the party member with the patch equipped")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==1:
						exp_box_desc.push_color(Color(0.017, 1.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+1 second of increased strength whenever a move can be used")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==8:
						exp_box_desc.push_color(Color(0.4, 0.0, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\nRandomizes turn progress after move use\nNo longer increases speed")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==14:
					exp_box_name.text="Second: Wind"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("When the party member with the patch dies the rest of the party gets a massive boost\n\nThe party member with this patch equipped cannot be revived")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==5:
						exp_box_desc.push_color(Color(1.0, 0.9, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+10 seconds of stun to every enemy when triggered")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==3:
						exp_box_desc.push_color(Color(1.0, 0.604, 0.12, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+30 seconds of debuffs to every enemy when triggered")
						exp_box_desc.pop()
						
				if CManager.currentPatches[dropOnParty-1]==15:
					exp_box_name.text="Revenge: Fireball"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Summons a fireball whenever an enemy gets killed\nDeals high singular damage and burns nearby enemies")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==6:
						exp_box_desc.push_color(Color(0.467, 0.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+15 burn damage on activation\nHas a chance to instakill every enemy\n\nNo longer summons a fireball")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==4:
						exp_box_desc.push_color(Color(1.0, 0.43, 0.972, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+50% Fireball Damage")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==16:
					exp_box_name.text="Protocol: Sword"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Every 2 seconds fires a sword that deals 10 damage to a random enemy")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==4:
						exp_box_desc.push_color(Color(1.0, 0.43, 0.972, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+1 Sword")
						exp_box_desc.pop()
						
					if CManager.party[dropOnParty-1]==1:
						exp_box_desc.push_color(Color(0.017, 1.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+1 second of decreased defense to enemies hit")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==17:
					exp_box_name.text="Protocol: Electrocute"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Every 10 seconds electrocutes a random enemy stunning it for 3 seconds and burning it for 25 damage")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==5:
						exp_box_desc.push_color(Color(1.0, 0.9, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+100 burn damage")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==2:
						exp_box_desc.push_color(Color(0.0, 0.967, 1.0, 1.0))  
						exp_box_desc.add_text("\n\nHarmony Bonus:\nNo longer stuns\n+25 burn damage\n+1/20 chance to cleave the enemy hit")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==18:
					exp_box_name.text="Protocol: Caffeinate"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Every 15 seconds fires a coffee mug that either heals a random member of your party for 100 health and raises their speed for 5 seconds or burns a random enemy for 100 damage")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==6:
						exp_box_desc.push_color(Color(0.467, 0.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+50 health to allies\n+5 seconds of increased speed to allies")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==4:
						exp_box_desc.push_color(Color(1.0, 0.43, 0.972, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+50 burn damage\n+5 seconds of decreased speed to enemies")
						exp_box_desc.pop()
				
				
				
				
				if CManager.currentPatches[dropOnParty-1]==19:
					exp_box_name.text="Revenge: Frogsicle"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Summons healing frogsicles for your entire party whenever an enemy gets killed")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==1:
						exp_box_desc.push_color(Color(0.017, 1.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+5 seconds of invincibility on activation")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==9:
						exp_box_desc.push_color(Color(1.0, 0.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+100 health regen on activation")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==20:
					exp_box_name.text="Revenge: Smite"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Smites a random enemy whenever an enemy gets killed\nDeals high singular damage and temporarily lowers their defense")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==5:
						exp_box_desc.push_color(Color(1.0, 0.9, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+60 Damage")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==8:
						exp_box_desc.push_color(Color(0.4, 0.0, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+15 seconds of decreased defense")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==21:
					exp_box_name.text="Block: Cleaving"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Stops your party from being killed at full health\nPrevents cleaving damage")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==2:
						exp_box_desc.push_color(Color(0.0, 0.967, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+5 seconds of increased speed upon blocking damage")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==6:
						exp_box_desc.push_color(Color(0.467, 0.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+30% health upon blocking damage")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==22:
					exp_box_name.text="Block: Stun"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Prevents your party from being stunned\nReduces fire damage by 2")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==4:
						exp_box_desc.push_color(Color(1.0, 0.43, 0.972, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+2 Fire damage\nFire damage now heals")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==7:
						exp_box_desc.push_color(Color(1.0, 0.683, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\nRandomizes fire damage between -2 and 3")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==23:
					exp_box_name.text="Block: Debuff"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Prevents your party from being afflicted with status debuffs")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==3:
						exp_box_desc.push_color(Color(1.0, 0.604, 0.12, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\nConverts negative status effects into their positive counterparts")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==8:
						exp_box_desc.push_color(Color(0.4, 0.0, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+30% health upon blocking debuffs")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==24:
					exp_box_name.text="Counter: Strike"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Automatically deals 100 damage to a random enemy\nTriggers whenever the party member with the patch equipped gets attacked")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==3:
						exp_box_desc.push_color(Color(1.0, 0.604, 0.12, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+10 seconds of decreased speed")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==1:
						exp_box_desc.push_color(Color(0.017, 1.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+200 damage")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==25:
					exp_box_name.text="Counter: Pummel"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Automatically deals 20 damage to two random enemies before dealing 75 damage to and decreasing the attack of a random enemy\nTriggers whenever the party member with the patch equipped gets attacked")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==5:
						exp_box_desc.push_color(Color(1.0, 0.9, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\nTriggers twice upon activation")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==8:
						exp_box_desc.push_color(Color(0.4, 0.0, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+100% Damage")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==26:
					exp_box_name.text="Protocol: Gamble"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Every 12 seconds rolls a dice, having a different effect based on the number rolled")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==7:
						exp_box_desc.push_color(Color(1.0, 0.683, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\nRemoves the ability to roll a 1 or 2")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==2:
						exp_box_desc.push_color(Color(0.0, 0.967, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\nNow has a chance to cleave on a 5 or 6")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==27:
					exp_box_name.text="Protocol: Pollute"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Every 15 seconds targets a random enemy, afflicting poison and negative status effects for 5 seconds")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==1:
						exp_box_desc.push_color(Color(0.017, 1.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+60 ")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==8:
						exp_box_desc.push_color(Color(0.4, 0.0, 1.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+15 seconds of decreased defense")
						exp_box_desc.pop()
						
				if CManager.currentPatches[dropOnParty-1]==28:
					exp_box_name.text="Protocol: Hydrate"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Every 20 seconds heals every member of your party for 75 health and applies a random positive status effect")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==9:
						exp_box_desc.push_color(Color(1.0, 0.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\nCan now apply regen and invincibility")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==6:
						exp_box_desc.push_color(Color(0.467, 0.0, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+25 health\nAdditionally heals and increases the speed of a random party member upon activation")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==29:
					exp_box_name.text="Counter: Electrocute"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Automatically burns and stuns a random enemy for 3 seconds\nTriggers whenever the party member with the patch equipped gets attacked")
					exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==5:
						exp_box_desc.push_color(Color(1.0, 0.9, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\n+2 seconds of stun")
						exp_box_desc.pop()
					if CManager.party[dropOnParty-1]==7:
						exp_box_desc.push_color(Color(1.0, 0.683, 0.0, 1.0)) 
						exp_box_desc.add_text("\n\nHarmony Bonus:\nRandomizes stun duration between 1 and 9 seconds")
						exp_box_desc.pop()
				
				if CManager.currentPatches[dropOnParty-1]==30:
					exp_box_name.text="Boost: Experience"
					exp_box_desc.text=""
					exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
					exp_box_desc.add_text("Doubles the experience gained by the party member with the patch equipped")
					exp_box_desc.pop()


				
				hovis=1
				hover_box.global_position.x=get_global_mouse_position().x-get_box_offset(get_global_mouse_position().x)
				hover_box.global_position.y=get_global_mouse_position().y-724
		elif showGlitch:
			print("WEEE")
			exp_box_name.text="Protocol: ERROR"
			exp_box_desc.text=""
			exp_box_desc.push_color(Color(1.0, 1.0, 1.0, 1.0)) 
			exp_box_desc.add_text("Will randomize moves available to the party member with the patch equipped")
			exp_box_desc.pop()
			exp_box_desc.push_color(Color(0.57, 0.0, 0.76, 1.0)) 
			exp_box_desc.add_text("\n\nHarmony Bonus:\nCannot be unequipped")
			exp_box_desc.pop()
			hovis=1
			hover_box.global_position.x=get_global_mouse_position().x-get_box_offset(get_global_mouse_position().x)
			hover_box.global_position.y=get_global_mouse_position().y-724
		else:
			if hovis>0:
				hovis-=30*delta
	else:
		hovis=0
		exp_box_desc.text=""
		
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
		if dropOnParty==2:
			if CManager.currentPatches[1]!=0 && patchGrabbed==0:
				if CManager.currentPatches[1]==1:
					curPicked=box_1_vis
					patchGrabbed=1
				if CManager.currentPatches[1]==2:
					curPicked=box_2_vis
					patchGrabbed=2
				if CManager.currentPatches[1]==3:
					curPicked=box_3_vis
					patchGrabbed=3
				if CManager.currentPatches[1]==4:
					curPicked=box_4_vis
					patchGrabbed=4
				if CManager.currentPatches[1]==5:
					curPicked=box_5_vis
					patchGrabbed=5
				if CManager.currentPatches[1]==6:
					curPicked=box_6_vis
					patchGrabbed=6
				if CManager.currentPatches[1]==7:
					curPicked=box_7_vis
					patchGrabbed=7
				if CManager.currentPatches[1]==8:
					curPicked=box_8_vis
					patchGrabbed=8
				if CManager.currentPatches[1]==9:
					curPicked=box_9_vis
					patchGrabbed=9
				if CManager.currentPatches[1]==10:
					curPicked=box_10_vis
					patchGrabbed=10
				if CManager.currentPatches[1]==11:
					curPicked=box_11_vis
					patchGrabbed=11
				if CManager.currentPatches[1]==12:
					curPicked=box_12_vis
					patchGrabbed=12
				if CManager.currentPatches[1]==13:
					curPicked=box_13_vis
					patchGrabbed=13
				if CManager.currentPatches[1]==14:
					curPicked=box_14_vis
					patchGrabbed=14
				if CManager.currentPatches[1]==15:
					curPicked=box_15_vis
					patchGrabbed=15
				if CManager.currentPatches[1]==16:
					curPicked=box_16_vis
					patchGrabbed=16
				if CManager.currentPatches[1]==17:
					curPicked=box_17_vis
					patchGrabbed=17
				if CManager.currentPatches[1]==18:
					curPicked=box_18_vis
					patchGrabbed=18
				if CManager.currentPatches[1]==19:
					curPicked=box_19_vis
					patchGrabbed=19
				if CManager.currentPatches[1]==20:
					curPicked=box_20_vis
					patchGrabbed=20
				if CManager.currentPatches[1]==21:
					curPicked=box_21_vis
					patchGrabbed=21
				if CManager.currentPatches[1]==22:
					curPicked=box_22_vis
					patchGrabbed=22
				if CManager.currentPatches[1]==23:
					curPicked=box_23_vis
					patchGrabbed=23
				if CManager.currentPatches[1]==24:
					curPicked=box_24_vis
					patchGrabbed=24
				if CManager.currentPatches[1]==25:
					curPicked=box_25_vis
					patchGrabbed=25
				if CManager.currentPatches[1]==26:
					curPicked=box_26_vis
					patchGrabbed=26
				if CManager.currentPatches[1]==27:
					curPicked=box_27_vis
					patchGrabbed=27
				if CManager.currentPatches[1]==28:
					curPicked=box_28_vis
					patchGrabbed=28
				if CManager.currentPatches[1]==29:
					curPicked=box_29_vis
					patchGrabbed=29
				if CManager.currentPatches[1]==30:
					curPicked=box_30_vis
					patchGrabbed=30
				CManager.currentPatches[1]=0
				boxback_2.color=Color(0.0, 0.0, 0.0, 0.0)
		if dropOnParty==3:
			if CManager.currentPatches[2]!=0 && patchGrabbed==0:
				if CManager.currentPatches[2]==1:
					curPicked=box_1_vis
					patchGrabbed=1
				if CManager.currentPatches[2]==2:
					curPicked=box_2_vis
					patchGrabbed=2
				if CManager.currentPatches[2]==3:
					curPicked=box_3_vis
					patchGrabbed=3
				if CManager.currentPatches[2]==4:
					curPicked=box_4_vis
					patchGrabbed=4
				if CManager.currentPatches[2]==5:
					curPicked=box_5_vis
					patchGrabbed=5
				if CManager.currentPatches[2]==6:
					curPicked=box_6_vis
					patchGrabbed=6
				if CManager.currentPatches[2]==7:
					curPicked=box_7_vis
					patchGrabbed=7
				if CManager.currentPatches[2]==8:
					curPicked=box_8_vis
					patchGrabbed=8
				if CManager.currentPatches[2]==9:
					curPicked=box_9_vis
					patchGrabbed=9
				if CManager.currentPatches[2]==10:
					curPicked=box_10_vis
					patchGrabbed=10
				if CManager.currentPatches[2]==11:
					curPicked=box_11_vis
					patchGrabbed=11
				if CManager.currentPatches[2]==12:
					curPicked=box_12_vis
					patchGrabbed=12
				if CManager.currentPatches[2]==13:
					curPicked=box_13_vis
					patchGrabbed=13
				if CManager.currentPatches[2]==14:
					curPicked=box_14_vis
					patchGrabbed=14
				if CManager.currentPatches[2]==15:
					curPicked=box_15_vis
					patchGrabbed=15
				if CManager.currentPatches[2]==16:
					curPicked=box_16_vis
					patchGrabbed=16
				if CManager.currentPatches[2]==17:
					curPicked=box_17_vis
					patchGrabbed=17
				if CManager.currentPatches[2]==18:
					curPicked=box_18_vis
					patchGrabbed=18
				if CManager.currentPatches[2]==19:
					curPicked=box_19_vis
					patchGrabbed=19
				if CManager.currentPatches[2]==20:
					curPicked=box_20_vis
					patchGrabbed=20
				if CManager.currentPatches[2]==21:
					curPicked=box_21_vis
					patchGrabbed=21
				if CManager.currentPatches[2]==22:
					curPicked=box_22_vis
					patchGrabbed=22
				if CManager.currentPatches[2]==23:
					curPicked=box_23_vis
					patchGrabbed=23
				if CManager.currentPatches[2]==24:
					curPicked=box_24_vis
					patchGrabbed=24
				if CManager.currentPatches[2]==25:
					curPicked=box_25_vis
					patchGrabbed=25
				if CManager.currentPatches[2]==26:
					curPicked=box_26_vis
					patchGrabbed=26
				if CManager.currentPatches[2]==27:
					curPicked=box_27_vis
					patchGrabbed=27
				if CManager.currentPatches[2]==28:
					curPicked=box_28_vis
					patchGrabbed=28
				if CManager.currentPatches[2]==29:
					curPicked=box_29_vis
					patchGrabbed=29
				if CManager.currentPatches[2]==30:
					curPicked=box_30_vis
					patchGrabbed=30
				CManager.currentPatches[2]=0
				boxback_3.color=Color(0.0, 0.0, 0.0, 0.0)
		if dropOnParty==4:
			if CManager.currentPatches[3]!=0 && patchGrabbed==0:
				if CManager.currentPatches[3]==1:
					curPicked=box_1_vis
					patchGrabbed=1
				if CManager.currentPatches[3]==2:
					curPicked=box_2_vis
					patchGrabbed=2
				if CManager.currentPatches[3]==3:
					curPicked=box_3_vis
					patchGrabbed=3
				if CManager.currentPatches[3]==4:
					curPicked=box_4_vis
					patchGrabbed=4
				if CManager.currentPatches[3]==5:
					curPicked=box_5_vis
					patchGrabbed=5
				if CManager.currentPatches[3]==6:
					curPicked=box_6_vis
					patchGrabbed=6
				if CManager.currentPatches[3]==7:
					curPicked=box_7_vis
					patchGrabbed=7
				if CManager.currentPatches[3]==8:
					curPicked=box_8_vis
					patchGrabbed=8
				if CManager.currentPatches[3]==9:
					curPicked=box_9_vis
					patchGrabbed=9
				if CManager.currentPatches[3]==10:
					curPicked=box_10_vis
					patchGrabbed=10
				if CManager.currentPatches[3]==11:
					curPicked=box_11_vis
					patchGrabbed=11
				if CManager.currentPatches[3]==12:
					curPicked=box_12_vis
					patchGrabbed=12
				if CManager.currentPatches[3]==13:
					curPicked=box_13_vis
					patchGrabbed=13
				if CManager.currentPatches[3]==14:
					curPicked=box_14_vis
					patchGrabbed=14
				if CManager.currentPatches[3]==15:
					curPicked=box_15_vis
					patchGrabbed=15
				if CManager.currentPatches[3]==16:
					curPicked=box_16_vis
					patchGrabbed=16
				if CManager.currentPatches[3]==17:
					curPicked=box_17_vis
					patchGrabbed=17
				if CManager.currentPatches[3]==18:
					curPicked=box_18_vis
					patchGrabbed=18
				if CManager.currentPatches[3]==19:
					curPicked=box_19_vis
					patchGrabbed=19
				if CManager.currentPatches[3]==20:
					curPicked=box_20_vis
					patchGrabbed=20
				if CManager.currentPatches[3]==21:
					curPicked=box_21_vis
					patchGrabbed=21
				if CManager.currentPatches[3]==22:
					curPicked=box_22_vis
					patchGrabbed=22
				if CManager.currentPatches[3]==23:
					curPicked=box_23_vis
					patchGrabbed=23
				if CManager.currentPatches[3]==24:
					curPicked=box_24_vis
					patchGrabbed=24
				if CManager.currentPatches[3]==25:
					curPicked=box_25_vis
					patchGrabbed=25
				if CManager.currentPatches[3]==26:
					curPicked=box_26_vis
					patchGrabbed=26
				if CManager.currentPatches[3]==27:
					curPicked=box_27_vis
					patchGrabbed=27
				if CManager.currentPatches[3]==28:
					curPicked=box_28_vis
					patchGrabbed=28
				if CManager.currentPatches[3]==29:
					curPicked=box_29_vis
					patchGrabbed=29
				if CManager.currentPatches[3]==30:
					curPicked=box_30_vis
					patchGrabbed=30
				CManager.currentPatches[3]=0
				boxback_4.color=Color(0.0, 0.0, 0.0, 0.0)
		if curPicked!=null:
			if curPicked.modulate!=Color(0.0, 0.0, 0.0, 1.0):
				if patchGrabbed==0:
					patchGrabbed=patchHoved
				curPicked.global_position=get_global_mouse_position()
			else:
				patchHoved=0
		
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
			if dropOnParty==2:
				curPicked.global_position=frog_box_2.position
				curPicked.z_index=2
				if CManager.currentPatches[1]==1:
					box_1_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==2:
					box_2_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==2:
					box_2_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==3:
					box_3_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==4:
					box_4_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==5:
					box_5_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==6:
					box_6_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==7:
					box_7_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==8:
					box_8_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==9:
					box_9_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==10:
					box_10_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==11:
					box_11_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==12:
					box_12_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==13:
					box_13_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==14:
					box_14_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==15:
					box_15_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==16:
					box_16_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==17:
					box_17_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==18:
					box_18_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==19:
					box_19_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==20:
					box_20_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==21:
					box_21_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==22:
					box_22_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==23:
					box_23_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==24:
					box_24_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==25:
					box_25_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==26:
					box_26_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==27:
					box_27_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==28:
					box_28_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==29:
					box_29_vis.position=Vector2.ZERO
				if CManager.currentPatches[1]==30:
					box_30_vis.position=Vector2.ZERO
				CManager.currentPatches[1]=patchGrabbed
				boxback_2.color=Color(0.0, 0.0, 0.0, 0.482)
				curPicked=null
			if dropOnParty==3:
				curPicked.global_position=frog_box_3.position
				curPicked.z_index=2
				if CManager.currentPatches[2]==1:
					box_1_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==2:
					box_2_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==2:
					box_2_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==3:
					box_3_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==4:
					box_4_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==5:
					box_5_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==6:
					box_6_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==7:
					box_7_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==8:
					box_8_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==9:
					box_9_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==10:
					box_10_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==11:
					box_11_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==12:
					box_12_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==13:
					box_13_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==14:
					box_14_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==15:
					box_15_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==16:
					box_16_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==17:
					box_17_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==18:
					box_18_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==19:
					box_19_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==20:
					box_20_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==21:
					box_21_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==22:
					box_22_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==23:
					box_23_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==24:
					box_24_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==25:
					box_25_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==26:
					box_26_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==27:
					box_27_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==28:
					box_28_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==29:
					box_29_vis.position=Vector2.ZERO
				if CManager.currentPatches[2]==30:
					box_30_vis.position=Vector2.ZERO
				CManager.currentPatches[2]=patchGrabbed
				boxback_3.color=Color(0.0, 0.0, 0.0, 0.482)
				curPicked=null
			if dropOnParty==4:
				curPicked.global_position=frog_box_4.position
				curPicked.z_index=2
				if CManager.currentPatches[3]==1:
					box_1_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==2:
					box_2_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==2:
					box_2_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==3:
					box_3_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==4:
					box_4_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==5:
					box_5_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==6:
					box_6_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==7:
					box_7_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==8:
					box_8_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==9:
					box_9_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==10:
					box_10_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==11:
					box_11_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==12:
					box_12_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==13:
					box_13_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==14:
					box_14_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==15:
					box_15_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==16:
					box_16_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==17:
					box_17_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==18:
					box_18_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==19:
					box_19_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==20:
					box_20_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==21:
					box_21_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==22:
					box_22_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==23:
					box_23_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==24:
					box_24_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==25:
					box_25_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==26:
					box_26_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==27:
					box_27_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==28:
					box_28_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==29:
					box_29_vis.position=Vector2.ZERO
				if CManager.currentPatches[3]==30:
					box_30_vis.position=Vector2.ZERO
				CManager.currentPatches[3]=patchGrabbed
				boxback_4.color=Color(0.0, 0.0, 0.0, 0.482)
				curPicked=null
		patchGrabbed=0



func _on_frog_button_mouse_entered() -> void:
	if !Input.is_action_pressed("lClick"):
		patchHoved=1


func _on_frog_button_mouse_exited() -> void:
	patchHoved=0


func _on_boxback_1_mouse_entered() -> void:

	if CManager.party[0]!=10 && CManager.party[0]!=0:
		dropOnParty=1


func _on_boxback_1_mouse_exited() -> void:
	dropOnParty=0
	showGlitch=false


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


func _on_boxback_2_mouse_entered() -> void:
	if CManager.party[1]!=10 && CManager.party[1]!=0:
		dropOnParty=2


func _on_boxback_3_mouse_entered() -> void:
	if CManager.party[2]!=10 && CManager.party[2]!=0:
		dropOnParty=3



func _on_boxback_4_mouse_entered() -> void:
	if CManager.party[3]!=10 && CManager.party[3]!=0:
		dropOnParty=4



func _on_glitch_button_mouse_exited() -> void:
	showGlitch=false


func _on_glitch_button_mouse_entered() -> void:
	showGlitch=true
