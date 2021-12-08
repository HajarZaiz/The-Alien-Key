/// @description Insert description here
// You can write your code in this editor

var tileCoords = get_tile_coords(x, y);
tileX = tileCoords.x;
tileY = tileCoords.y;

var screenCoords = get_screen_coords(tileX, tileY);
x = screenCoords.x;
y = screenCoords.y;