class Particula{
Body b;
float r;
Particula (float x, float y, float r_){
  r=r_;
 
makeBody(x, y, r);
    b.setUserData(this);
}

 void killBody() {
    box2d.destroyBody(b);
  }
   void change() {
    Do.play();
  }

  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(b);
    // Get its angle of rotation
    float a = b.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(#D11C1C);
    noStroke();
    ellipse(0, 0, r*2,r*2);
    popMatrix();
  }
void makeBody(float x, float y, float r) {
BodyDef bd = new BodyDef();
bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    b = box2d.createBody(bd);
CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 1.5;

    // Attach fixture to body
    b.createFixture(fd);

    b.setAngularVelocity(random(-50, 50));
  }

}