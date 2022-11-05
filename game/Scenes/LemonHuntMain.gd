extends Node2D

var lemonInstance = load("res://Actors/Lemon.tscn")
var raspberryInstance = load("res://Actors/Raspberry.tscn")
var screenSize = Vector2(1024,600)
var rng = RandomNumberGenerator.new()
var score = 0

func randomSpawn(fruit):
	var instance = fruit.instance()
	rng.randomize()
	#var randX = rng.randf_range(50,screenSize.x)
	var randY = rng.randf_range(50,screenSize.y-50)
	instance.position = Vector2(-30,randY)
	add_child(instance)
	instance.connect("Death",self,"incrementScore")
	
func incrementScore():
	score += 1
	$UI/Score.text = "Score: %s" % score

func _ready():
	randomSpawn(lemonInstance)
	randomSpawn(raspberryInstance)

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		randomSpawn(lemonInstance)
		randomSpawn(raspberryInstance)
