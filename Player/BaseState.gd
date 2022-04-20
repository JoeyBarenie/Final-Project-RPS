class_name BaseState
extends Node

enum State {
	Null,
	Idle,
	Walk,
	Jump,
	Fall
}

export (String) var animation_name

var player : Player

func enter():
	player.Animations.play(animation_name)

func exit():
	pass

func input(event):
	return State.Null

func process(delta):
	return State.Null

func physics_process(delta):
	return State.Null
