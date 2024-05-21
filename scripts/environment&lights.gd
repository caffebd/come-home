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



func _time_transition_0():
	var tween = create_tween().parallel()
	tween.tween_property($WorldEnvironment, "environment:sky:sky_material:sky_top_color", Color("327085"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:sky:sky_material:sky_horizon_color", Color("000000"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:sky:sky_material:ground_horizon_color", Color("000000"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:volumetric_fog_albedo", Color("3c3c3c"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:volumetric_fog_emission", Color("0f2722"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:volumetric_fog_density", 0.05, 2.0)
	tween.tween_property($sun, "light_energy", 0.0, 2.0)
	tween.tween_property($moon, "light_energy", 0.08, 2.0)

func _time_transition_1():
	var tween = create_tween().parallel()
	tween.tween_property($WorldEnvironment, "environment:sky:sky_material:sky_top_color", Color("1c4a53"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:sky:sky_material:sky_horizon_color", Color("aa6a4c"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:sky:sky_material:ground_horizon_color", Color("aa6a4c"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:volumetric_fog_albedo", Color("ffffff"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:volumetric_fog_emission", Color("77604a"), 2.0)
	tween.tween_property($WorldEnvironment, "environment:volumetric_fog_density", 0.0265, 2.0)
	tween.tween_property($sun, "light_energy", 0.17, 2.0)
	tween.tween_property($moon, "light_energy", 0.089, 2.0)



func _time_transition_2():
	pass


func _time_transition_3():
	pass
	
func _time_transition_4():
	pass

func _time_transition_5():
	pass

func _time_transition_6():
	pass

func _time_transition_7():
	pass

func _time_transition_8():
	pass

func _time_transition_9():
	pass
