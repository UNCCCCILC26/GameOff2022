extends Node2D


var partOne = false
var lemonInstance = load("res://Actors/LemonTutorial.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var instance = lemonInstance.instance()
	add_child(instance)
	#load guy
	#say thing
	#pause until guy actually dies
	#continue scene
	#killa few more guys
	#scene end
	pass # Replace with function body.

func _process(delta):
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
