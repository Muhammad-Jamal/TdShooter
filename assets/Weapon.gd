extends Node3D
class_name Weapon


@export var bullet = preload("res://assets/bullet.tscn")
@export var barrelExit:Node3D
@onready var muzzleFlashLight = $BarrelExit/OmniLight3D
@onready var timer = $BarrelExit/OmniLight3D/Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("shootAction")):
		shoot()
	

func shoot():
	var instance:Node3D = bullet.instantiate()
	barrelExit.add_child(instance)
	muzzleFlashLight.light_energy = 5;
	timer.start()


func _on_timer_timeout():
	muzzleFlashLight.light_energy = 0
