extends Node

var main_index :int = 0
var sub_index :int =0

var corner_index: int = 3

var mound_index: int = 4
var clearing_index:int = 4

var orb_index: int = 6

var dad_gone_index: int = 7

var leave_clearing_index: int = 8

var night_path_index: int = 9

var fork_index: int = 13

var animal_stick_index: int = 15

var stick_worked_index: int = 16


var all_narration = [
	["My dad was the only one who called me Saif instead of Saiful."],
	["My dad always liked to take me on long walks through the forest...", "but that day we went further than we had ever been before."],
	["I remembered feeling excited and wondering if he had something special planned."],
	["For a second I panicked when I lost sight of my dad."],
	["Dad always liked to teach me something when we went walking."],
	["I suddenly realised I lost the 10 Taka note my dad gave me...", "I had to find it, otherwise he would be really upset."],
	["While I was looking around, I saw something glowing...", "I wanted to show dad what I had found."],
	["Dad was gone. I looked around frantically but he was nowhere to be seen.", "I had to find him."],
	["At the time, I felt I had to follow that glowing light."],
	["It started to get dark."],
	["I'd never been out in the forest this late before."],
	["I'd never been left on my own this long before."],
	["It was getting cold and I began to shiver."],
	["I came to a fork in the road. That was when I had to make a choice."],
	["Follow the glowing light, or follow my dad's voice?"],
	["I remember hearing animal footsteps. Then I rememberd a trick my dad had taught me.", "Throw a stick into the forest as a distraction."],
	["It worked!"]
]

func narrate():
	if main_index < all_narration.size():
		if sub_index < all_narration[main_index].size():
			print ("Read current main index "+str(main_index))
			GlobalSignals.emit_signal("show_narration", all_narration[main_index][sub_index])
			sub_index += 1
			
		else:
			main_index += 1
			sub_index = 0
			print ("Read next main index "+str(main_index))
			GlobalSignals.emit_signal("show_narration", all_narration[main_index][sub_index])
			sub_index += 1
	else:
		GlobalSignals.emit_signal("show_narration", "NARATION COMPLETE")
		 
func hide_narration():
	if sub_index == all_narration[main_index].size():
		main_index += 1
		sub_index = 0
		print (" HN main "+str(main_index)+" sub "+str(sub_index))
	else:
		narrate()
		


		
