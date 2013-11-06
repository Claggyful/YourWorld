/// Allocate a single cube in the world, and return the block_info index
/// x = argument0
/// y = argument1
/// z = argument2
var _x=argument0;
var _y=argument1;
var _z=argument2;

var column = ds_grid_get(Map,_x,_y);
column[_z] = 0;
ds_grid_set(Map,_x,_y,column);
RefCount[0]++;

