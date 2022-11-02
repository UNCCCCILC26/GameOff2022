extends StaticBody2D

var is_inside = false

func _ready():
	pass # Replace with function body.

func _on_DetectBox_area_entered(area):
	is_inside = true

func _on_DetectBox_area_exited(area):
	is_inside = false;

func _process(delta):
	if Input.is_action_just_pressed("interact") and is_inside == true:
		pass
