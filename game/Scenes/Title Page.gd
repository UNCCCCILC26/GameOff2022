extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Button_pressed():
<<<<<<< Updated upstream
	get_tree().change_scene("res://Scenes/Resteraunt.tscn")
=======
	var scene = load("res://Scenes/CutScene.tscn")
	var instance = scene.instance()
	instance.SceneSwitch = load("res://Scenes/Resteraunt.tscn")
	instance.cutscene = 0
	add_child(instance)
>>>>>>> Stashed changes
