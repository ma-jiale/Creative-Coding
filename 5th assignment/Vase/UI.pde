import controlP5.*;
ControlP5 slider;

void UI(){
  int sliderWidth = 300;//控制条宽度
  int sliderHeight = 30;//控制条高度
  
  slider = new ControlP5(this, createFont("微软雅黑", 14));
    slider.addSlider("section")
    .setPosition(20, 20)
    .setSize(sliderWidth, sliderHeight)
    .setRange(3, 72)
    .setValue(10);

    slider.addSlider("layer")
    .setPosition(20, 60)
    .setSize(sliderWidth, sliderHeight)
    .setRange(10, 100)
    .setValue(50);
    
    slider.addSlider("maxRadiu")
    .setPosition(20, 100)
    .setSize(sliderWidth, sliderHeight)
    .setRange(10, 1000)
    .setValue(500);
    
     slider.addSlider("vaHeight")
    .setPosition(20, 140)
    .setSize(sliderWidth, sliderHeight)
    .setRange(1, 100)
    .setValue(50);
    
     slider.addSlider("Amplitude")
    .setPosition(20, 180)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0,200)
    .setValue(50);
    
     slider.addSlider("r")
    .setPosition(20, 220)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0,255)
    .setValue(106);
    
         slider.addSlider("g")
    .setPosition(20, 260)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0,255)
    .setValue(106);
    
             slider.addSlider("b")
    .setPosition(20, 300)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0,255)
    .setValue(106);
    slider.setAutoDraw(false);
}
