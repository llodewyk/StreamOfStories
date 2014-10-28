class StoryStream{
  color clr;
  int current_inc;
  float x, y, xoffset, yoffset;
  
  StoryStream() {
    this.x = 0;
    this.y = random(height);
    this.xoffset = random(width);
    this.yoffset = y;
    if (this.y > 300){
      this.clr = color(int(random(100)),int(random(100)),int(random(200))+56);
    }
    else {
      this.clr = color(int(random(200))+56,int(random(100)),int(random(100)));
    }
  }
}
