//--------------------- Mvmnt Variables ------------------

playerSpeed = 0;
//------------------------ Inputs ------------------------

left = keyboard_check(ord("A")) || keyboard_check(vk_left);
right = keyboard_check(ord("D")) || keyboard_check(vk_right);
up = keyboard_check(ord("W")) || keyboard_check(vk_up);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);
sprint = keyboard_check(vk_shift);

//-------------------- Collisions -------------------------
var clb1=tilemap_get_at_pixel(tileset1, bbox_left, bbox_bottom) & tile_index_mask;
var crb1=tilemap_get_at_pixel(tileset1, bbox_right, bbox_bottom) & tile_index_mask;
var clt1=tilemap_get_at_pixel(tileset1, bbox_left, bbox_top) & tile_index_mask;
var crt1=tilemap_get_at_pixel(tileset1, bbox_right, bbox_top) & tile_index_mask;

var clb2=tilemap_get_at_pixel(tileset2, bbox_left, bbox_bottom) & tile_index_mask;
var crb2=tilemap_get_at_pixel(tileset2, bbox_right, bbox_bottom) & tile_index_mask;
var clt2=tilemap_get_at_pixel(tileset2, bbox_left, bbox_top) & tile_index_mask;
var crt2=tilemap_get_at_pixel(tileset2, bbox_right, bbox_top) & tile_index_mask;

//Still need the bbox equivalent with isometric projection

//---------------Vertical & Horizontal Combined------------

if((left || right) && (up || down)){
	if(sprint) playerSpeed = sprintSpeed;
	else playerSpeed = walkSpeed;
	//Walk along the tiles
	xv = (right - left)*playerSpeed;
	yv = (down - up)*playerSpeed/2;
}
//--------------------Horizontal Movement------------------

else if (left || right) {
	if(sprint) playerSpeed = sprintSpeed;
	else playerSpeed = walkSpeed;
	xv = (right - left)*playerSpeed;
	yv = 0;
	//update_player_sprite();
}

//--------------------Vertical Movement--------------------

else if (up || down) {
	if(sprint) playerSpeed = sprintSpeed;
	else playerSpeed = walkSpeed;
	yv = (down - up)*playerSpeed;
	xv = 0;
	//update_player_sprite();
}else{
	yv = 0;
	xv = 0;
}

//Move if on top of tiles
if((clb1 || clb2) && (crb1 || crb2) && (clt1 || clt2) && (crt1 || crt2)){
	hspeed = xv;
	vspeed = yv;
}else{
	hspeed = 0;
	vspeed = 0;
}

