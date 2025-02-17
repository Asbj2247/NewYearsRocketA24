class Rocket {
  // attributter
  int diameter = 5; // diameter

  PVector pos;
  float angle = random(radians(-30), radians(30)); // Begræns vinklen til mellem -30 og 30 grader

  float xSpeed = random(0.05, 1.5); // Tilfældig vandret hastighed
  float ySpeed = random (-2.8, -1.5); // lodret hastighed som skal tilpasses skærmstørrelsen
  PVector velocity = new PVector(xSpeed, ySpeed);

  // farver til eksplosion RGB og opauqe værdi alfa
  int r=int(random(256));
  int g=int(random(256));
  int b=int(random(256));
  int alfa=255;

  //PVector velocity = new PVector(cos(angle), -2 + sin(angle));
  float minHeight = height-(height/4); // Minimumshøjde
  boolean exploded = false;

  // lyd
  boolean soundPayed = false; // bruges til lyd

  // konstruktør
  Rocket() {
    pos = new PVector(random(10, 80), height); // Startposition tilfældigt langs bunden
  }

  // metoder
  void playExplodingSound() {
    if (!soundPayed ) {
      singleRocket.play();
      soundPayed = true;
    }
  }

  void display() {
    if (!exploded) {
      circle(pos.x, pos.y, diameter);
    } else {
      playExplodingSound(); // afspil lyd


      explode(); // Tegn eksplosion i nedarvningen!
    }
  }

  void move() {
    // for at variere højden
    float yspeed = random(0.0001, 0.01);
    float xspeed = random(0.00001, 0.0005); // Begræns den vandrette hastighed

    if (!exploded) {

      pos.add(velocity);
      velocity.y += yspeed;
      velocity.x += xspeed;
      checkExplosion();
    }
  }

  void checkExplosion() {
    // Tjek om raketten er på vej nedad og har nået minimumshøjden
    if ((velocity.y > 0 || pos.x > width - 20 || pos.x < 20) && pos.y < minHeight) {
      exploded = true;
    }
  }

  void explode() {
  } // metode til overwirte
}


/**********************************************/

class MyRocket extends Rocket {
  @Override
    void explode() {
    // Tilføj eventuelle yderligere eksplosionseffekter her
    fill(r, g, b, alfa);
    ellipse(pos.x, pos.y, diameter * 2, diameter * 2);
    diameter++;
    alfa--;
    noStroke();
  }
}

class asbj2247 extends Rocket {
  @Override
    void explode() {

    fill(r, g, b, alfa);
    noStroke();
    float x1 = pos.x;
    float y1 = pos.y - diameter;
    float x2 = pos.x - diameter;
    float y2 = pos.y + diameter;
    float x3 = pos.x + diameter;
    float y3 = pos.y + diameter;

    triangle(x1, y1, x2, y2, x3, y3);

    diameter++;
    alfa--;
  }
}
