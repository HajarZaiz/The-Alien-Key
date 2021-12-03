event_inherited();

if (tileMovementProgress == -2.0) {
	
	// Inputs
	var left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	var right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	var up = keyboard_check(ord("W")) || keyboard_check(vk_up);
	var down = keyboard_check(ord("S")) || keyboard_check(vk_down);
	
	// Set the movement based on the inputs
	if (up && left) moveDirection = MoveDirection.TopLeft;
	else if (up && right) moveDirection = MoveDirection.TopRight;
	else if (down && left) moveDirection = MoveDirection.BottomLeft;
	else if (down && right) moveDirection = MoveDirection.BottomRight;
	else moveDirection = MoveDirection.Idle;
	
	if (moveDirection != MoveDirection.Idle) {
		tileMovementProgress = -1.0;
		previousDirection = moveDirection;
	}
}
