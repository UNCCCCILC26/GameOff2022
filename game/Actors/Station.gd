extends StaticBody2D

var is_inside = false

export(PackedScene) var linkedScene
export(Texture) var style

func _ready():
	get_node("Sprite").texture = style

func _on_DetectBox_area_entered(area):
	is_inside = true

func _on_DetectBox_area_exited(area):
	is_inside = false;

func _process(delta):
	if Input.is_action_just_pressed("interact") and is_inside == true:
		pass
