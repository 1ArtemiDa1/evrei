extends Node3D
#Просто для тестирование 3дшных штук.

@onready var label = $CanvasLayer/Label





func _on_die_roll_finished(val):
	label.text = str(val);
