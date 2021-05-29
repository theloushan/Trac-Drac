using Godot;
using System;

public class controlTest : KinematicBody2D
{
	// Declare member variables here. Examples:
	// private int a = 2;
	// private string b = "text";
	[Export] public int speed = 200;
	
	public Vector2 target = new Vector2();
	public Vector2 velocity = new Vector2();
	
	public void GetInput ()
	{
		
		target = GetGlobalMousePosition();
		velocity = new Vector2();
		
	}

	// Called when the node enters the scene tree for the first time.
	public override void _PhysicsProcess(float delta)
	{
		GetInput();
		velocity = Position.DirectionTo(target) * speed;
		
		if (Position.DistanceTo(target) > 5)
		{ velocity = MoveAndSlide(velocity); }
	}

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}
