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

func input(_event):
	return State.Null

func process(_delta):
	return State.Null

func physics_process(_delta):
	return State.Null
