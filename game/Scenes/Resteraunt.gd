extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var scene = load("res://Actors/Station.tscn") 
	var instance = scene.instance()
	instance.scalex = 1
	Global.connect("playerBalanced_changed", self, "updateBalance")
	updateBalance()
		
func updateBalance():
	$RichTextLabel.text = "Balance: " + str(Global.playerBalance)


func _process(delta):
	pass
