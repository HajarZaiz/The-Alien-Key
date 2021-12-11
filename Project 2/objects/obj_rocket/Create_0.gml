/// @description Insert description here
// You can write your code in this editor

x = 5617;
y = 3306;

var tileCoords = get_tile_coords(obj_player.x, obj_player.y);
var coords = get_screen_coords(tileCoords.x, tileCoords.y);
dropPlayerX = coords.x;
dropPlayerY = coords.y;

playedDropped = false;

image_angle = point_direction(x, y, 0, 0) - 90;
direction = point_direction(x, y, 0, 0);
speed = 30;
obj_player.visible = false;
obj_player.inCutscene = true;

particleType = part_type_create();
part_type_shape(particleType, pt_shape_pixel);
part_type_size(particleType, 5, 15, 0, 0.5);
part_type_color2(particleType, c_orange, c_yellow);
part_type_alpha2(particleType, 1.0, 0.0);
part_type_speed(particleType, 2, 5, -0.1, 0);
part_type_direction(particleType, direction - 50, direction + 50, 0, 0);
part_type_blend(particleType, true);
part_type_life(particleType, 30, 60);


