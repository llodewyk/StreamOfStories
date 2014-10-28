StoryStream [] streams;
import ddf.minim.*;
Minim minim;
AudioPlayer c1, h1, h2, t1, t2, r1, r2, sf1, sf2, f1, f2, re1, re2, re3, m1;
PImage img;
int last_second;
int array_counter;

void setup() {
  size(800, 800);
  smooth();
  background(0, 0, 0);
  streams = new StoryStream [60];
  streams[0] = new StoryStream();
  last_second = second();
  array_counter = 0;
  noStroke();
  img = loadImage("cup.png");
  minim = new Minim(this);
  c1 = minim.loadFile("c1.wav") ;
  h1 = minim.loadFile("h1.wav") ;
  h2 = minim.loadFile("h2.wav") ;
  t1 = minim.loadFile("t1.wav") ;
  t2 = minim.loadFile("t2.wav") ;
  r1 = minim.loadFile("r1.wav") ;
  r2 = minim.loadFile("r2.wav") ;
  sf1 = minim.loadFile("sf1.wav") ;
  sf2 = minim.loadFile("sf2.wav") ;
  f1 = minim.loadFile("f1.wav") ;
  f2 = minim.loadFile("f2.wav") ;
  re1 = minim.loadFile("re1.wav") ;
  re2 = minim.loadFile("re2.wav") ;
  re3 = minim.loadFile("re3.wav") ;
  m1 = minim.loadFile("m1.wav") ;
}

void mousePressed()
{
  c1.pause();
  f1.pause();
  f2.pause();
  r1.pause();
  r2.pause();
  h1.pause();
  h2.pause();
  t1.pause();
  t2.pause();
  sf1.pause();
  sf2.pause();
  re1.pause();
  re2.pause();
  re3.pause(); 
  m1.pause();
  
  //audio
  if (mouseY > 400){ //Comedy/romance/reflective/fiction
    int x = int(random(8));
      if (x == 1){
       c1.play();
       c1.rewind();
      }
      else if (x == 2){
       r1.play();
       r1.rewind();
      }
      else if (x == 3){
       f1.play();
       f1.rewind();
      }
      else if (x == 4){
       f2.play();
       f2.rewind();
      }
      else if (x == 5){
       re1.play();
       re1.rewind();
      }
      else if (x == 6){
       re2.play();
       re2.rewind();
      }
      else if (x == 7){
       re3.play();
       re3.rewind();
      }
      else{
       r2.play();
       r2.rewind();
      }
  }
  else{ //Horror/SciFi/Thriller/mysetery
    int x = int(random(7));
      if (x == 1){
       h1.play();
       h1.rewind();
      }
      else if (x == 2){
       h2.play();
       h2.rewind();
      }
      else if (x == 3){
        t1.play();
        t1.rewind();
      }
      else if (x == 4){
       sf1.play();
       sf1.rewind();
      }
      else if (x == 5){ 
        sf2.play();
        sf2.rewind();
      }
      else if (x == 6){ 
        m1.play();
        m1.rewind();
      }
      else{
       t2.play();
       t2.rewind();
      }
  }
}

void draw() {
  
  cursor(img,0,0);
  
  fill(50,50,50,5);
  rect(0,0,width,height);
  
  int this_second = second();
  if(this_second != last_second) {
    streams[array_counter] = new StoryStream();
    last_second = this_second;
    array_counter = (array_counter+1) % streams.length;
  }
  
  for(int i=0; i<min(streams.length, array_counter); i++) {
    streams[i].x++;
    streams[i].y = streams[i].yoffset + sin(((streams[i].x + streams[i].xoffset) % width)/width * TWO_PI) * 20;
    fill(streams[i].clr);
    ellipse(streams[i].x, streams[i].y, 3, 8);
  }
}

//boolean colliding(Obj a, Obj b) {
  //return (abs(a.x-b.x) < max(a.r, b.r)) && (abs(a.y-b.y) < max(a.r, b.r));
//}


class Obj{
  color clr;
  int current_inc;
  float x, y, xoffset, yoffset;
  
  Obj() {
    this.x = 0;
    this.y = random(height);
    this.xoffset = random(width);
    this.yoffset = y;
    if (this.y > 400){
      this.clr = color(int(random(100)),int(random(100)),int(random(150))+156);
    }
    else {
      this.clr = color(int(random(150))+156,int(random(100)),int(random(100)));
    }
  }
}


