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
public class Planet{
  int[] loc;
  color myColor;
  int mySize;
  int dx, dy;
  String name;
  
  public Planet(){
    println("making an planet");
    loc = new int[2];
    assignDefaultValues();
  }
  
  void assignDefaultValues(){
    println("assigning values");
    name = "a planet";
    loc[0] = 100;
    loc[1] = 200;
    myColor = color(255,255,0);
    mySize = 50;
    dx = dy = 10;
  }
  
  void drawPlanet(){
    fill(myColor);
    ellipse(loc[0], loc[1], mySize, mySize);
    if( loc[0] + mySize / 2 >= 600 || loc[0] - mySize / 2 <= 0 ){
      dx *= -1;
    }
    if( loc[1] + mySize / 2 >= 600 || loc[1] - mySize / 2 <= 0 ){
      dy *= -1;
    }
    loc[0] += dx;
    loc[1] += dy;
//    println(name+ " loc: " + loc[0] + ", " + loc[1]);
  }
}

public class Meteor extends Planet {
  
  boolean followMouse;
  
  public Meteor(){
    super();
    println("actually im a meteor");
    
    myColor = color( random(255), random(255), random(255) );
    
    dx = (int) random(3, 17);
    dy = (int) random(3, 17);
    
    followMouse = false;
  }
  
  void drawPlanet(){
    if ( followMouse ) {
      fill(myColor);
      loc[0] = mouseX;
      loc[1] = mouseY;
      ellipse(loc[0], loc[1], mySize, mySize);
    }
    else{
      super.drawPlanet();
    }
    
  }
  
}

