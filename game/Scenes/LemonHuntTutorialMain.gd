extends Node2D

signal partOne

var score = 0
var partOne = false
var tutLemonInstance = load("res://Actors/LemonTutorial.tscn")
var lemonInstance = load("res://Actors/Lemon.tscn")
var partTwoEmitStatus = false
var spawnEnemies = false

func incrementScore():
	score += 1
	$UI/Score.text = "Fruits Captured: %s" % score
	if(score >= 4 and !partTwoEmitStatus):
		spawnEnemies = false

func partOneComplete():
	emit_signal("partOne")

func runDialogue():
	print("Dialogue")
	
func endScene():
	print("Scene Ended")

func _ready():
	var instance = tutLemonInstance.instance()
	add_child(instance)
	instance.connect("Death",self,"incrementScore")
	instance.connect("Death",self,"partOneComplete")
	runDialogue()
	yield(self, "partOne")
	spawnEnemies = true
	runDialogue()
	yield(get_tree().create_timer(2),"timeout")
	while(spawnEnemies):
		instance = lemonInstance.instance()
		add_child(instance)
		instance.connect("Death",self,"incrementScore")
		yield(get_tree().create_timer(4),"timeout")
	runDialogue()
	yield(get_tree().create_timer(6),"timeout")
	endScene()
