extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var oldMousePos = get_viewport().get_mouse_position()
	yield(get_tree().create_timer(10*delta),"timeout")
	#oldMousePos.x = oldMousePos.x-30
	self.position = oldMousePos
	
