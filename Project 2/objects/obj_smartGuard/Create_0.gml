event_inherited();

var tileCoords = get_tile_coords(x, y);
tileX = tileCoords.x;
tileY = tileCoords.y;

var screenCoords = get_screen_coords(tileX, tileY);
x = screenCoords.x;
y = screenCoords.y;

//patrolling variables
upRight = 3;
upLeft = 3;
downRight = 3;
downLeft = 3;

movableTiles = [TileType.Ground, TileType.Spike];
//Prevent decreasing health repetitively
canDamage = true;

searching = false;

