void UI(){
 cp = new ControlP5(this,createFont("微软雅黑",16));
 cp.addSlider("radiu",0,1000,50,50,500,30).setLabel("直径");
 cp.addSlider("section",3,100,50,50+40,500,30).setLabel("细分");
 cp.addSlider("layer",0,100,50,50+80,500,30).setLabel("高度");
 cp.setAutoDraw(false);
}
