extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		leaveStation()

func leaveStation():
	get_parent().remove_child(self)

func _on_Button_pressed():
	leaveStation() # Replace with function body.
