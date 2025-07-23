extends Node2D
@onready var textbox = $textbox

func _input(event):
	if event.is_action_pressed("ui_down"):
		textbox.showquestion(
			"Когда-то давным давно, в далёкой-далёкой галактике, жил-был один
			старый дед. Он умер. Как давно он умер?",
			[
				"Давным давно.", "Недавно", "Только что", "Хто я?"
			]
		)
		
	if event.is_action_pressed("ui_accept"):
		textbox.skip();

func _process(delta):
	
	pass;
