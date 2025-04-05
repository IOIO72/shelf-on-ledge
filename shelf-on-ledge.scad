
/* [Shelf] */
shelf_thickness = 2.5;
shelf_depth = 49.9999999999;
shelf_length = 59.9999999999;

/* [Ledge] */
ledge_height = 20.1;
ledge_depth = 21.5;
ledge_length = 59.9999999999;
ledge_wall_thickness = 1.5;

/* [Combination] */
offset_depth = 0;
offset_length = 0;

/* [Additional Parts] */
additional_left_shelf_length = 0;
additional_right_shelf_length = 0;
additional_left_ledge_length = 0;
additional_right_ledge_length = 0;


module additional_parts(left_length, right_length, height, wall_thickness) {
  translate([-left_length, 0, 0]) {
    cube([left_length, wall_thickness, height]);
  }
  translate([ledge_length, 0, 0]) {
    cube([right_length, wall_thickness, height]);
  }
}

module ledge() {
  difference() {
      cube([ledge_length, ledge_depth + 2 * ledge_wall_thickness, ledge_height + shelf_thickness]);
      translate([0, ledge_wall_thickness, shelf_thickness]) {
          cube([ledge_length, ledge_depth, ledge_height]);
      }
  }
  additional_parts(additional_left_ledge_length, additional_right_ledge_length, ledge_height + shelf_thickness, ledge_wall_thickness);
}

module shelf() {
  cube([shelf_length, shelf_depth, shelf_thickness]);
  additional_parts(additional_left_shelf_length, additional_right_shelf_length, shelf_thickness, shelf_depth);
}

ledge();
translate([offset_length, offset_depth, 0]) {
  shelf();
}
