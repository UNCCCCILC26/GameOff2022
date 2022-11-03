extends Node2D

var lemonInstance = load("res://Actors/Lemon.tscn")
var screenSize = Vector2(1024,600)
var rng = RandomNumberGenerator.new()

func randomSpawn(fruit):
	var instance = fruit.instance()
	rng.randomize()
	#var randX = rng.randf_range(50,screenSize.x)
	var randY = rng.randf_range(50,screenSize.y)
	instance.position = Vector2(0,randY)
	add_child(instance)
	pass

func _ready():
	randomSpawn(lemonInstance)
	pass

#func _process(delta):
#	pass
