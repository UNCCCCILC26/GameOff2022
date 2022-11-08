extends Node2D

var meetCustomer = false
var stationOne = false
var stationTwo = false 
var stationThree = false

var tutorial = false


func _ready():
	Global.connect("playerBalanced_changed", self, "updateBalance")
	updateBalance()
		
func updateBalance():
	$RichTextLabel.text = "Balance: " + str(Global.playerBalance)

func _process(delta):
	if stationThree:
		tutorial = true

