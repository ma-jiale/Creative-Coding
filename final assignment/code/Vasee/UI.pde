import controlP5.*;
ControlP5 slider;
ColorPicker colorPicker;

void UI(){
  int sliderWidth = 300;//控制条宽度
  int sliderHeight = 30;//控制条高度
  
  slider = new ControlP5(this, createFont("微软雅黑", 14));
    Slider s1 = slider.addSlider("section")
    .setPosition(20, 20)
    .setSize(sliderWidth, sliderHeight)
    .setRange(3, 90)
    .setValue(10);
    s1.setCaptionLabel("断面边数");

    Slider s2 = slider.addSlider("heightMM")
    .setPosition(20, 60)
    .setSize(sliderWidth, sliderHeight)
    .setRange(50, 500)
    .setValue(100);
    s2.setCaptionLabel("高度 单位：MM");
    
    Slider s3 = slider.addSlider("maxRadiuMM")
    .setPosition(20, 100)
    .setSize(sliderWidth, sliderHeight)
    .setRange(20, 100)
    .setValue(10);
    s3.setCaptionLabel("半径 单位：MM");
    
     Slider s4 = slider.addSlider("thicknessMM")
    .setPosition(20, 140)
    .setSize(sliderWidth, sliderHeight)
    .setRange(1, 20)
    .setValue(1);
    s4.setCaptionLabel("厚度 单位：MM");
    
     Slider s5 =slider.addSlider("layer")
    .setPosition(20, 180)
    .setSize(sliderWidth, sliderHeight)
    .setRange(2, 100)
    .setValue(30);
    s5.setCaptionLabel("高度分段数");
    
     Slider s6 = slider.addSlider("Amplitude")
    .setPosition(20, 220)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0,200)
    .setValue(50);
    s6.setCaptionLabel("半径相变");
    
    slider.addButton("clickButton1")
    .setPosition(20, 340) 
    .setSize(80, 30) 
    .setCaptionLabel("显示网格"); 
    
    slider.addButton("clickButton2")
    .setPosition(120, 340) 
    .setSize(80, 30) 
    .setCaptionLabel("保存模型"); 
    
     colorPicker = slider.addColorPicker("colorPicker")
    .setPosition(20, 260)
    .setSize(80, 30) 
    .setColorValue(color(255, 255, 255)); // 设置初始颜色
    
    slider.setAutoDraw(false);
    
}

void clickButton1() {
  displayMesh = !displayMesh;
}

void clickButton2() {
  record = !record;
}

void lightSettings() {
  lightSpecular(255, 255, 255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  specular(200, 200, 200);
  shininess(15);
}
