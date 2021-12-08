event_inherited();

if (tileMovementProgress == -2.0) {

	if (upRight > 0) {
		moveDirection = MoveDirection.TopRight;
		upRight = upRight - 1;
	}
	else if (downRight > 0 and upRight == 0) {
		moveDirection = MoveDirection.BottomRight;
		downRight = downRight -1;
	}
	else if (downLeft > 0 ) {
		moveDirection = MoveDirection.BottomLeft;
		downLeft = downLeft -1;
	}
	else if (upLeft > 0) {
		moveDirection = MoveDirection.TopLeft;
		upLeft = upLeft - 1;
	}
	else {
		//Reset
		upRight = 3;
		upLeft = 3;
		downRight = 3;
		downLeft = 3;
		moveDirection = MoveDirection.Idle;
	}
	
	if (moveDirection != MoveDirection.Idle) {
		tileMovementProgress = -1.0;
	}
}
