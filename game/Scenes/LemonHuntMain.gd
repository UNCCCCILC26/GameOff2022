extends Node2D

var lemonInstance = load("res://Actors/Lemon.tscn").instance()

#var screenSize = Vector2()

func randomSpawn(instance):
	instance.position = Vector2(400,400)
	add_child(instance)
	pass

func _ready():
	randomSpawn(lemonInstance)
	pass

#func _process(delta):
#	pass
