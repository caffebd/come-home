extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignals.time_transition_0.connect(_time_transition_0)
	GlobalSignals.time_transition_1.connect(_time_transition_1)
	GlobalSignals.time_transition_2.connect(_time_transition_2)
	GlobalSignals.time_transition_3.connect(_time_transition_3)
	GlobalSignals.time_transition_4.connect(_time_transition_4)
	GlobalSignals.time_transition_5.connect(_time_transition_5)
	GlobalSignals.time_transition_6.connect(_time_transition_6)
	GlobalSignals.time_transition_7.connect(_time_transition_7)
	GlobalSignals.time_transition_8.connect(_time_transition_8)
	GlobalSignals.time_transition_8.connect(_time_transition_9)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("night_0"):
		_time_transition_0()
	if event.is_action_pressed("night_1"):
		_time_transition_1()
	if event.is_action_pressed("night_2"):
		_time_transition_2()
	if event.is_action_pressed("night_3"):
		_time_transition_3()
	if event.is_action_pressed("night_4"):
		_time_transition_4()
	if event.is_action_pressed("night_5"):
		_time_transition_5()
	if event.is_action_pressed("night_6"):
		_time_transition_6()
	if event.is_action_pressed("night_7"):
		_time_transition_7()
	if event.is_action_pressed("night_8"):
		_time_transition_8()
	if event.is_action_pressed("night_9"):
		_time_transition_9()

func _time_transition_0():
	print ("Transition 0")
	var tween = create_tween().parallel()
	tween.tween_property($WorldEnvironment, "environment:sky:sky_material:sky_top_color", Color("327085"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:sky:sky_material:sky_horizon_color", Color("000000"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:sky:sky_material:ground_horizon_color", Color("000000"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:volumetric_fog_albedo", Color("3c3c3c"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:volumetric_fog_emission", Color("0f2722"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:volumetric_fog_density", 0.05, 2.0)

func _time_transition_1():
	print ("Transition 1")
	pass



func _time_transition_2():
	print ("Transition 2")
	pass


func _time_transition_3():
	print ("Transition 3")
	pass
	
func _time_transition_4():
	print ("Transition 4")
	pass

func _time_transition_5():
	print ("Transition 5")
	pass

func _time_transition_6():
	print ("Transition 6")
	pass

func _time_transition_7():
	print ("Transition 7")
	pass

func _time_transition_8():
	print ("Transition 8")
	pass

func _time_transition_9():
	print ("Transition 9")
	pass
