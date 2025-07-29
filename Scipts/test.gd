extends Node2D
@onready var textbox = $textbox

#На стрелочку вниз можно вызвать текстовое окно с вопросом. Однако, нажатие 
#кнопку пока ничего не делает.
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

#Сюда получается, на какое ребро упал куб.
func _on_die_roll_finished(val):
	pass # Replace with function body.
