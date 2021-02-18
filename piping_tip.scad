use <parametric_star.scad>

$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

height=30; // height of piping tip
radius=11; // radius of piping tip
angle=80; // the angle of the wall
wall_thickness=1; // wall thickness of piping tip
lip_thickness=1; // thickness of lip
lip_height=1.5; // height of lip
top_thickness=1.5; // thickness of the top of the tip with the pattern

points=8; // number of points on the star

union() {
    difference() {
        union() {
            cylinder(h=height, r1=radius, r2=radius-(height/tan(angle)));
            cylinder(h=lip_height, r1=radius+lip_thickness, r2=radius+(lip_thickness-(lip_height/tan(angle))));
        }
        cylinder(h=height, r1=radius-wall_thickness, r2=(radius-wall_thickness)-(height/tan(angle)));
    }
    difference() {
        translate([0,0,28.5]) {
            cylinder(h=top_thickness, r1=4.975, r2=radius-(height/tan(angle)));
        }
        translate([0,0,28.5]) {
            parametric_star(N=points, ri=2.5, re=4, h=top_thickness);
        }
    }
}