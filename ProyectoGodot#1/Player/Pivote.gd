extends Node3D

var lookSensitivity: float = 15.0
var minLookAngle : float = -20.0
var maxLookAngle : float = 75.0

#vectores

var mouseDelata = Vector2()

#componentes

@onready var player = get_parent()

#get_parent() lo usamos para decirle al script que use al padre



func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouseDelata = event.relative


func _process(delta: float) -> void:
	var rot = Vector3(mouseDelata.y, mouseDelata.x, 0) * lookSensitivity * delta

	rotation_degrees.x += rot.x
	rotation_degrees.x = clamp(rotation_degrees.x, minLookAngle, maxLookAngle)

	player.rotation_degrees.y -= rot.y

	mouseDelata = Vector2()


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#con esto ocultamos el mouse
