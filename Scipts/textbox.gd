extends CanvasLayer
@onready var displayed = $Control/Panel/MarginContainer/RichTextLabel
@onready var texttimer = $Control/texttimer
@onready var buttontimer = $buttontimer #пока не используется, но может быть нужен в будущем
@onready var buttons = [
$Control/answercontainer/answer1, 
$Control/answercontainer/answer2,
$Control/answercontainer/answer3,
$Control/answercontainer/answer4
]
signal answer_selected(answer_index: int)


var full_text = "";
var curr_text = "";
var char_per_sec = 20;
var typing = false;
var button_text = [];
var curr_button_char = 1;

func _ready():
	hide();
	
func showquestion(text: String, answer_text: Array):
	full_text = text;
	curr_text = "";
	button_text = answer_text;
	displayed.text = "";
	typing = true;
	texttimer.wait_time = 1.0/char_per_sec;
	buttontimer.wait_time = texttimer.wait_time;
	texttimer.start();
	show();
	for i in range(buttons.size()):
		buttons[i].text = answer_text[i];
	buttontimer.start();
	
	
func _on_texttimer_timeout():
	if full_text.length() > curr_text.length():
		curr_text += full_text[curr_text.length()];
		displayed.text = curr_text;
	else:
		texttimer.stop();
		typing = false;

func skip():
	if typing:
		displayed.text = full_text;
		texttimer.stop();
		typing = false;


#сигналы для того, чтобы понять, какую кнопку нажимали. Нужно для других сцен,
#хотя я не совсем уверен. ЫЫЫЫх. программировать сложно.
func _on_answer_1_pressed():
	emit_signal("answer_selected", 1);


func _on_answer_2_pressed():
	emit_signal("answer_selected", 2);


func _on_answer_3_pressed():
	emit_signal("answer_selected", 3);


func _on_answer_4_pressed():
	emit_signal("answer_selected", 4);
