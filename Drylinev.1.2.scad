// Dryline - mechanical disk brake cable vent

$fn=100; // set smoothness (larger = smoother)

// commence Dryline
difference() {
    union() {
        body();
        mirror() body();
    }
    
    // Emboss front lettering and markings
    // Emboss branding
    translate([0,-3,1]) {
        linear_extrude(height = 0.6, convexity = 10, slices = 20, scale = 1) {
            text(text = "Dryline", size = 5, 
            font = ".Helvetica Neue   DeskInterface:style=Bold",
            halign = "center", valign = "baseline", spacing = 1, 
            script = "latin", direction = "ltr");
        }
    }
    // Emboss trimming markings
    translate([-23.5,-11,1]) {
        linear_extrude(height = 0.6, convexity = 10, slices = 20, scale = 1) {
            text(text = "trim>", size = 3, 
            font = ".Helvetica Neue   DeskInterface:style=Bold",
            halign = "center", valign = "baseline", spacing = 1.15, 
            script = "latin", direction = "ltr");
        }
    }
    translate([24,-11,1]) {
        linear_extrude(height = 0.6, convexity = 10, slices = 20, scale = 1) {
            text(text = "<trim", size = 3, 
            font = ".Helvetica Neue   DeskInterface:style=Bold",
            halign = "center", valign = "baseline", spacing = 1.15, 
            script = "latin", direction = "ltr");
        }
    }
}



module body() {
    difference() {
        union() {
            // backing plate
            translate([5.9,0,0.5]) cube([12,10,2], center=true);

            translate([20,-5,0]) {
                minkowski() {
                    cube([16,16,1], center=true);
                    cylinder(r=2,h=1);
                }
            }
    
            //cable stop
            translate([15,5,4.5]) rotate([0,90,0]) cylinder(h=15, d=10);
        }

    // cable gland
        translate([12,5,4.5]) rotate([0,90,0]) cylinder(h=20,d=3);
    // sheath gland
        translate([18,5,4.5]) rotate([0,90,0]) cylinder(h=13,d=6.2);
    // ziptie ducts
        translate([18,0.5,0]) rotate([20,0,0]) cube([4,2.5,15], center=true);
        translate([0,3.8,0]) cube([4,2.5,15], center=true);
    // trimming marks
        translate([17,-15,1]) cube([1,7,1]);
    }
}