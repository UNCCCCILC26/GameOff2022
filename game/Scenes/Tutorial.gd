extends Node2D

var meetCustomer = true
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
	if !meetCustomer:
		$"Main/Ice/DetectBox".position.y = 1000
	if !stationOne:
		$"Main/Drink/DetectBox".position.y = 1000
	if !stationTwo:
		$"Main/Flavor/DetectBox".position.y = 1000
	if stationThree:
		tutorial = true
		print("Tutorial Completed")
		
func generateOrder():
	

