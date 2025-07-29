extends RigidBody3D
@onready var raycasts = $raycasts.get_children();
#Код, который я списал с туториала на ютубе. Работает без проблем.

var start_pos; 
var roll_str = 10;
var rolling = false;

signal roll_finished(val);


func _ready():
	start_pos = global_position;
	
func _input(event):
	if event.is_action_pressed("ui_accept") and not rolling:
		roll();
		
func roll():
	sleeping = false;
	freeze = false;
	transform.origin = start_pos;
	linear_velocity = Vector3.ZERO;
	angular_velocity = Vector3.ZERO; 
	
	transform.basis = Basis(Vector3.RIGHT, randf_range(0, 2 * PI)) * transform.basis;
	transform.basis = Basis(Vector3.UP, randf_range(0, 2 * PI)) * transform.basis;
	transform.basis = Basis(Vector3.FORWARD, randf_range(0, 2 * PI)) * transform.basis;
	
	
	var throw_vector = Vector3(randf_range(-1, 1), 0, randf_range(-1, 1)).normalized();
	angular_velocity = throw_vector * roll_str/2;
	apply_central_impulse(throw_vector * roll_str);
	
	rolling = true;


func _on_sleeping_state_changed():
	if sleeping:
		var landed_on_side = false;
		for raycast in raycasts:
			if raycast.is_colliding():
				roll_finished.emit(raycast.opposite_side);
				rolling = false;
				landed_on_side = true;
		if not landed_on_side:
			roll();
