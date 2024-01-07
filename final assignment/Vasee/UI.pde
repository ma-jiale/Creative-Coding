import controlP5.*;
ControlP5 slider;

void UI(){
  int sliderWidth = 300;//控制条宽度
  int sliderHeight = 30;//控制条高度
  
  slider = new ControlP5(this, createFont("微软雅黑", 14));
    Slider s1 = slider.addSlider("section")
    .setPosition(20, 20)
    .setSize(sliderWidth, sliderHeight)
    .setRange(3, 100)
    .setValue(10);
    s1.setCaptionLabel("细分");

    Slider s2 = slider.addSlider("heightMM")
    .setPosition(20, 60)
    .setSize(sliderWidth, sliderHeight)
    .setRange(50, 500)
    .setValue(100);
    s2.setCaptionLabel("高度");
    
    Slider s3 = slider.addSlider("maxRadiuMM")
    .setPosition(20, 100)
    .setSize(sliderWidth, sliderHeight)
    .setRange(20, 100)
    .setValue(10);
    s3.setCaptionLabel("半径");
    
     Slider s4 = slider.addSlider("thicknessMM")
    .setPosition(20, 140)
    .setSize(sliderWidth, sliderHeight)
    .setRange(1, 20)
    .setValue(1);
    s4.setCaptionLabel("厚度");
    
     Slider s5 =slider.addSlider("layer")
    .setPosition(20, 180)
    .setSize(sliderWidth, sliderHeight)
    .setRange(2, 100)
    .setValue(50);
    s5.setCaptionLabel("层数");
    
     Slider s6 = slider.addSlider("Amplitude")
    .setPosition(20, 220)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0,200)
    .setValue(50);
    s6.setCaptionLabel("振幅");
    
     slider.addSlider("r")
    .setPosition(20, 260)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0,255)
    .setValue(255);
    
     slider.addSlider("g")
    .setPosition(20, 300)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0,255)
    .setValue(255);
    
     slider.addSlider("b")
    .setPosition(20, 340)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0,255)
    .setValue(255);
    slider.setAutoDraw(false);
    
    
    

}
