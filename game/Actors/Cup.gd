extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var iceAmount
var sweetener
var flavoring

# Called when the node enters the scene tree for the first time.
func _ready():
	iceAmount = Global.cup["ice"]
	sweetener = Global.cup["sweetener"]
	flavoring = Global.cup["flavoring"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
