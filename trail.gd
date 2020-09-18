extends Line2D

export var step_size = 5
export var max_points = 20
export var kill_every = 0.02

var last_point = Vector2()
var target

var timer = 0
func _ready():
	set_as_toplevel(true)
	target = get_parent()
	last_point = target.global_position

func _physics_process(delta):
	var new_point = target.global_position
	if ((new_point - last_point).length_squared() >= pow(step_size,2)):
		add_point(new_point)
	if get_point_count() > max_points:
		remove_point(0)
	timer += delta
	if timer > kill_every:
		remove_point(0)
		timer = 0

	
	
