/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
movableTiles = [TileType.Lava];

harmfulTiles = ds_list_create();
ds_list_add(harmfulTiles, TileType.Water);
ds_list_add(harmfulTiles, TileType.Ground);
ds_list_add(harmfulTiles, TileType.Spike);
