extends Control

func hidePopup():
	self.hide()

func _process(_delta):
	if(Input.is_action_just_pressed("ui_cancel")):
		self.hidePopup()
