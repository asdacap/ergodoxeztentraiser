// Ergodox stand feet radius
$feetradius = 5.2;

// Radius of the base of the object
$baseradius = 15;

// Height increase
$height = 15;

// Wall size for the grip
$wall = 0.8;

translate([0,0,$feetradius+$height])
difference() {
    union() {
        translate([0,0,-$feetradius-$wall])
        linear_extrude($feetradius+$wall)
        circle($feetradius+$wall, center=true, $fn=64);

        sphere($feetradius+$wall, $fn=32);
    }

    union() {
        translate([0,0,5])
        union() {
            cube([8, ($feetradius+$wall)*2, 10], center=true);
        }

        translate([0,0,2])
        linear_extrude(100)
        circle($feetradius+$wall, center=true, $fn=64);

        linear_extrude(100)
        circle($feetradius-0.2, center=true, $fn=64);
        sphere($feetradius, $fn=32);
    }
}

linear_extrude($height, scale=($feetradius+$wall)/$baseradius)
circle($baseradius, center=true, $fn=64);
