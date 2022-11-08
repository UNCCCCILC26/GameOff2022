extends Node2D

var lemonInstance = load("res://Actors/Lemon.tscn")
var raspberryInstance = load("res://Actors/Raspberry.tscn")
var blueberryInstance = load("res://Actors/Blueberry.tscn")
var coconutInstance = load("res://Actors/Coconut.tscn")
var screenSize = Vector2(1024,600)
var rng = RandomNumberGenerator.new()
var score = 0

func randomSpawn(fruit):
	var instance = fruit.instance()
	add_child(instance)
	instance.connect("Death",self,"incrementScore")
	
func incrementScore():
	score += 1
	$UI/Score.text = "Fruits Captured: %s" % score

func _ready():
	randomSpawn(lemonInstance)
	randomSpawn(raspberryInstance)
	randomSpawn(blueberryInstance)
	randomSpawn(coconutInstance)

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		randomSpawn(lemonInstance)
		randomSpawn(raspberryInstance)
		randomSpawn(blueberryInstance)
		randomSpawn(coconutInstance)
