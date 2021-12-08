instance_destroy();
lives = lives - health_damage;
if(lives <= 0){
	room_goto(GameOver);
}