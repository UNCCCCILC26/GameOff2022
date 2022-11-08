extends Node2D

var score = 0
var partOne = false
var lemonInstance = load("res://Actors/LemonTutorial.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var instance = lemonInstance.instance()
	add_child(instance)
	instance.connect("Death",self,"incrementScore")
	#load guy
	#say thing
	#pause until guy actually dies
	#continue scene
	#killa few more guys
	#scene end
	pass # Replace with function body.

func _process(delta):
	
	pass
	
func incrementScore():
	score += 1
	$UI/Score.text = "Score: %s" % score
	if(!partOne):
		partOne = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
