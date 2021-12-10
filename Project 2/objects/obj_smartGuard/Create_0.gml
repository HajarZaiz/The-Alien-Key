event_inherited();

tileX = 9;
tileY = 15;


var coords = get_screen_coords(tileX, tileY);
x = coords.x;
y = coords.y;

var tileCoords = get_tile_coords(x, y);
tileX = tileCoords.x;
tileY = tileCoords.y;

//patrolling variables
upRight = 3;
upLeft = 3;
downRight = 3;
downLeft = 3;

movableTiles = [TileType.Ground];
//Prevent decreasing health repetitively
canDamage = true;

searching = false;
