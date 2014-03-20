Planet earth;
Planet sun;

ArrayList<Meteor> mets;

void setup() {
  size(600, 600);
  frameRate(25);
  background(0);
  earth = new Planet();
  earth.name = "Earth";
  earth.myColor = color(0, 0, 255);
  earth.dx = earth.dy = -5;
  earth.loc[0] = 58;

  sun = new Planet();
  sun.name = "Sun";
  sun.mySize = 150;
  sun.dx = sun.dy = 5;

  mets = new ArrayList<Meteor>();
}

void draw() {
  background(0);
 
  sun.drawPlanet();
  earth.drawPlanet();

  for ( Meteor met : mets) {
    met.drawPlanet();
  }
  fill(255);
  text("press f to make another meteor START following", 20, 20);
  text("press s to make another meteor STOP following", 20, 40);
  text("press d to REMOVE another meteor", 20, 60);
}

void mouseClicked() {
  mets.add( new Meteor() );
}
void keyPressed() {
  if ( key == 'd' ){
    if ( !mets.isEmpty() ) {
      mets.remove(0);
    }
  } else if ( key == 'f' ) {
    for ( int i = 0; i < mets.size(); i++) {
      Meteor met = (Meteor) mets.get(i);
      if ( !met.followMouse ){
        met.followMouse = true;
        break;
      }
    }
  } else if ( key == 's' ) {
    for ( int i = 0; i < mets.size(); i++) {
      Meteor met = (Meteor) mets.get(i);
      if ( met.followMouse ){
        met.followMouse = false;
        break;
      }
    }
  }
}
