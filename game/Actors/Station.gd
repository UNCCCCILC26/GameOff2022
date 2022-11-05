extends StaticBody2D

var is_inside = false

export(PackedScene) var linkedScene
export(Texture) var style
export var scalex = 1.0
export var scaley = 1.0

func _ready():
	$DetectBox/CollisionShape2D/Sprite.texture = style
	$DetectBox/CollisionShape2D.scale.x = scalex
	$DetectBox/CollisionShape2D.scale.y = scaley

func _on_DetectBox_area_entered(area):
	is_inside = true

func _on_DetectBox_area_exited(area):
	is_inside = false;

func _process(delta):
	if Input.is_action_just_pressed("interact") and is_inside == true:
		 get_node("../../Main").add_child(linkedScene.instance())
