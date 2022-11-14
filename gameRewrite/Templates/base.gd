extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		pauseMenu()

func pauseMenu():
	get_tree().root.add_child(load("res://Global/TitlePage.tscn").instance())
