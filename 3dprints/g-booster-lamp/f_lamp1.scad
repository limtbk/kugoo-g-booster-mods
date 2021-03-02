dc=.4;
w=1.5;

module lamp() {
    translate([0,0,12/2])
        cylinder(d=22, h=12, $fn=32, center=true);
    translate([0,0,-21/2])
        cylinder(d=10, h=21, $fn=32, center=true);
}

module lampHole() {
    translate([0,0,-21/2])
        cylinder(d=10, h=21, $fn=32, center=true);
}

module lampGroup() {
    ld=23;
    for (t=[[0,0,0],[0,ld,0],[sqrt(3)/2*ld,ld/2,0]]) {
        translate(t)
            lamp();
    }
}

module lampHoleGroup() {
    ld=23;
    for (t=[[0,0,0],[0,ld,0],[sqrt(3)/2*ld,ld/2,0]]) {
        translate(t)
            lampHole();
    }
}

module lightCase() {

difference() {
intersection() {
    union() {
    translate([60/2,60/2,w/2-28])
        cube([60,60,w], center=true);
    translate([60/2,60/2,w/2-5+5])
        cube([60,60,w], center=true);
    }
    caseF();
    
}
translate([15,15,-3.5+5])
    lampGroup(); 

translate([0,0,-40])
hull() {
    for (t=[[0+dc/2+w,0+dc/2+w,0],[0+dc/2+w,50-dc/2-1.9*w,0],[31-dc/2-w,0+dc/2+w,0],[31-dc/2-w,30-dc/2-0.8*w,0]]) {
        translate(t)
            cylinder(h=70+0.01, d=0.4, $fn=16, center=true);
    }
}

}

//translate([15,15,-3.5+5])
//    lampGroup(); 

difference() {
    case();
    rotate([0,90,0]) {
        translate([35,0,2]){
            translate([-16-6,12,0])
                cylinder(d=12, h=5, $fn=32, center=true);
            translate([-47-5,12,0])
                cylinder(d=10, h=5, $fn=32, center=true);
            hull() {   
            translate([-47-5,12+17+10,0])
                cylinder(d=10, h=5, $fn=32, center=true);
            translate([-47-5+8,12+17+10,0])
                cylinder(d=10, h=5, $fn=32, center=true);
            }
            translate([-47-5,12+5+4.5/2+5,0])
                cylinder(d=5, h=5, $fn=32, center=true);
            }
    }
}
//}

}
/*
difference() {
lightCase();

translate([48,25,55])
rotate([0,45,0])
    cube([70,70,70], center=true);
}
*/
module mainOuter() {
    cd=5;
    hull() {
        for (t=[[45.6,0.3,5],[45.6,0.3,-5],[45.6,39,5],[45.6,39,-5],[39.5,0.3,-25],[39.5,43,-25],[43,40.6,7],[17.5,47.3,32],[2.48,51.93,32],[2.48,0.3,32],[17.5,0.3,32 ],[2.48,0.3,-25],[2.48,51.93,-5],[2.48,47.8,-25]]) {
            translate(t)
                sphere(d=cd, $fn=32);
        }
    }
}

module mainInner() {
    hull() {
        for (t=[[0+dc/2+w,0+dc/2+w,15],[48-dc/2-w,0+dc/2+w,15],[48-dc/2-w,40+dc/2-w,15],[0+dc/2+w,55-dc/2-1.7*w,15]]) {
            translate(t)
                cylinder(h=40+0.01, d=0.4, $fn=16, center=true);
        }
        g=25;
        for (t=[[0+dc/2+w,0+dc/2+w,-g+w],[0+dc/2+w,50-dc/2-w,-g+w],[41-dc/2-w,0+dc/2+w,-g+w],[41-dc/2-w,45-dc/2-w,-g+w]]) {
            translate(t)
                cylinder(h=5+0.01, d=0.4, $fn=16, center=true);
        }
    }
}

module connOuter() {
    translate([0,0,-10])
    hull() {
        for (t=[[0+dc/2,0+dc/2,0],[0+dc/2,50-dc/2,0],[31-dc/2,0+dc/2,0],[31-dc/2,30-dc/2,0]]) {
            translate(t)
                cylinder(h=50, d=0.4, $fn=16, center=true);
        }
    }
}

module connInner() {
    translate([0,0,-10])
    hull() {
        for (t=[[0+dc/2+w,0+dc/2+w,0],[0+dc/2+w,50-dc/2-1.9*w,0],[31-dc/2-w,0+dc/2+w,0],[31-dc/2-w,30-dc/2-0.8*w,0]]) {
            translate(t)
                cylinder(h=50+0.01, d=0.4, $fn=16, center=true);
        }
    }    
}

module mainHoles() {
    rotate([0,90,0]) {
        translate([35,0,2]){
            translate([-16-6,12,0])
                cylinder(d=12, h=5, $fn=32, center=true);
            translate([-47-5,12,0])
                cylinder(d=10, h=5, $fn=32, center=true);
            hull() {   
            translate([-47-5,12+17+10,0])
                cylinder(d=10, h=5, $fn=32, center=true);
            translate([-47-5+8,12+17+10,0])
                cylinder(d=10, h=5, $fn=32, center=true);
            }
            translate([-47-5,12+5+4.5/2+5,0])
                cylinder(d=5, h=5, $fn=32, center=true);
            }
    }

}

module outer() {
difference() {
    union() {
        mainOuter();
        connOuter();
    }
    union() {
        mainInner();
        mainHoles();
        connInner();
    }
}


}

//difference() {
//    mainOuterCapArea();
//}

/*
translate([15,15,-3.5+5])
    lampGroup();
*/

//outer();

module transOuter() {
    cd=3;
/*    hull() {
        for (t=[[45.6,0.3,5],[45.6,39,5],[43,40.6,7],[17.5,47.3,32],[2.48,51.93,32],[2.48,0.3,32],[17.5,0.3,32]]) {
            translate(t)
                sphere(d=cd, $fn=32);
        }
    } */
    
    difference() {
        union() {
            hull() {
                for (t=[[17.5,47.3,32],[2.48,51.93,32],[2.48,0.3,32],[17.5,0.3,32],[17.5,47.3,34],[2.48,51.93,34],[2.48,0.3,34],[17.5,0.3,34]]) {
                    translate(t)
                        sphere(d=cd, $fn=32);
                }
            }

            hull() {
                for (t=[[45.6,0.3,5],[45.6,39,5],[43,40.6,7],[17.5,47.3,32],[17.5,0.3,32],[45.6+2,0.3,5],[45.6+2,39,5],[43+2,40.6,7],[17.5+2,47.3,32],[17.5+2,0.3,32]]) {
                    translate(t)
                        sphere(d=cd, $fn=32);
                }
            }        
            
            hull() {
                for (t=[[17.5,47.3,32],[17.5,0.3,32],[17.5,47.3,34],[17.5,0.3,34],[17.5,47.3,32],[17.5,0.3,32],[17.5+2,47.3,32],[17.5+2,0.3,32]]) {
                    translate(t)
                        sphere(d=cd, $fn=32);
                }
            }
        }
        outer();
        
        translate([30+1.5,19.8,15+1.5])
            rotate([0,-46.3,0])
                hull() {
                    cube([5,35,35], center=true);
                    translate([0,25,17.4])
                        cube([5,0.1,0.1], center=true);
                }
        translate([10.5,19.8+3.5,30.5])
            rotate([0,90,0])
                hull() {
                    cube([5,42,15], center=true);
                    translate([0,25,-8])
                        cube([5,0.1,0.1], center=true);
                }

    }
    
}



module mainOuterCapArea() {
    translate([39+10/2,25,-5])
        cube([10,60,50], center=true);
/*
    cd=5;
    hull() {
        for (t=[[45.6,0.3,5],[45.6,0.3,-5],[45.6,39,5],[45.6,39,-5],[39.5,0.3,-25],[39.5,43,-25]]) {
            translate(t)
                cube([cd,cd,cd], center=true);
//                sphere(d=cd, $fn=32);
        }
    }
    */
}


module mainPart() {
    difference() {
        outer();
        mainOuterCapArea();
    }
}

module mholes() {
    translate([60/2+7,60/2-21,w/2-5+5])
        cylinder(h=4*w, d=3, $fn=16, center=true);
    
}



module topPart() {
    intersection() {
        outer();
        mainOuterCapArea();
    }
    /*
    difference() {
        union() {
            translate([60/2+7,60/2-21,w/2-5+5+w+0.3])
                cube([20,15,w], center=true);    
            translate([60/2+7,60/2-21,w/2-5+5-w-0.3])
                cube([20,15,w], center=true);    
        }
        mholes();
    }*/
}

module lampMount() {
    difference() {
        intersection() {
            difference() {
                translate([60/2,60/2,w/2-5+5])
                    cube([60,60,w], center=true);
                translate([15,15,-3.5+5+0.01])
                    lampHoleGroup();
//                mholes();5
            }
            mainOuter();
        }
        translate([0.01,0,0])
            topPart();
    }
}

translate([25,0,0])
    topPart();
mainPart();
lampMount();


module bolt() {
    translate([0,0,12/2+2.5/2])
        cylinder(d=6, h=2.5, $fn=32, center=true);
    cylinder(d=3, h=12, $fn=32, center=true);
}

module nut() {
    difference() {
        cylinder(d=6.35, h=2.3, $fn=6, center=true);
        cylinder(d=2.9, h=2.31, $fn=16, center=true);
    }
}


module boltPlace() {
rotate([0,90,0])
    difference() {
        cylinder(d=8, h=11, $fn=6, center=true);
        cylinder(d=3, h=11.01, $fn=32, center=true);
        translate([0,0,-11/2+2.3/2-0.01])
            nut();
    }
}

/*
translate([42.59,3,2])
    boltPlace();

translate([42.59,37,-2])
    boltPlace();
*/


//color("gray", alpha=0.4)
//    transOuter();
