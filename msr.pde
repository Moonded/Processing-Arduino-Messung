import org.gicentre.utils.stat.*;
import controlP5.*;
import processing.serial.*;
import java.util.*;
import static javax.swing.JOptionPane.*;
import processing.core.PApplet;

ControlP5 cp5;
XYChart lineChart;



String myText = "0";
String lan;
int i;
int l;
float p1;
boolean s1;
float p2;
int port;
int port2 = 0;
int read;
int x = 0;
float[] yachsis = {0};
float[] xachsis = {0};
int f;
int a;
boolean lock;
int random;
boolean s;
int j = 0;
String[] list;
char[] c;
boolean clear;
String[] args = {"TwoFrameTest"};
String url;


Serial myPort;

void setup() {
  
  
  PImage icon = loadImage("icon.png");
  surface.setIcon(icon);

  list = Serial.list();

  a = list.length;

  myPort = new Serial(this, Serial.list()[j], 9600);

  cp5 = new ControlP5(this);
  size(750, 420);

  cp5.addButton("info")
    .setCaptionLabel("Info")
    .setPosition(0, 0)
    .setWidth(30)
    ;

  cp5.addButton("addport")
    .setCaptionLabel("Port Hinzufuegen")
    .setPosition(150, 25)
    .setHeight(20)
    .setWidth(90)
    ;

  cp5.addButton("image")
    .setCaptionLabel("Screenshot")
    .setPosition(240, 25)
    .setHeight(20)
    .setWidth(70)
    ;

  cp5.addButton("count")
    .setCaptionLabel("Start/Stop")
    .setPosition(310, 25)
    .setHeight(20)
    .setWidth(70);
  ;

  cp5.addButton("clear")
    .setCaptionLabel("Reset")
    .setPosition(380, 25)
    .setHeight(20)
    .setWidth(70)
    ;
}

void serialEvent (Serial myPort) {
  myText = myPort.readStringUntil('\n');
}

void language(int n) {
  lan = cp5.get(ScrollableList.class, "language").getItem(n).get("name").toString();
  cp5.get(ScrollableList.class, "language").close();
}


void addport() {
  s = !s;
}

void draw() {



  if (clear == true) {

    Arrays.fill(yachsis, 0);
    Arrays.fill(xachsis, 0);
    l = 0;
    clear = false;
    s1 = false;
  }


  String s = "";
  for (String n : list)
    s+= n;

  if (myText != null) {
    x = Integer.parseInt(myText.trim());
  }

  background(#2C2F33);
  fill(#ffffff);
  stroke(255);
  rect(50, 65, 500, 300);

  random = (int)random(-40, 140);
  if (l != 150) {
    if (s1 == true) {
      if (read != -1) {
        p1 = (float) x;
      }
      yachsis = append(yachsis, p1);
      l++;
      p2 = (float) l;
      xachsis = append(xachsis, p2);

      delay(50);
    }
  }

  if (l == 150) {
    s1 = !s1;
  }

  if (s1 == false) {
    lineChart = new XYChart(this);
    lineChart.setData(xachsis, yachsis);

    lineChart.showXAxis(true); 
    lineChart.showYAxis(true); 
    lineChart.setMinY(0);

    lineChart.setYFormat("000°");
    lineChart.setXFormat("0000");

    lineChart.setPointSize(0);
    lineChart.setLineWidth(2);
  }

  lineChart.draw(50, 65, 500, 300);
  fill(#e23e22);
  text("Eingaben "+l, 50, 400);

  text("Momentane Temperatur = "+x, 200, 400);

  if (lock == false) {
    text("Momentaner COM Port: "+j, 580, 75);

    if (a == 1) {
      text("[0] "+list[0], 580, 90);
    } else if (a == 2) {
      text("[0] "+list[0], 580, 90);
      text("[1] "+list[1], 580, 105);
    } else if (a == 3) {
      text("[0] "+list[0], 580, 90);
      text("[1] "+list[1], 580, 105);
      text("[2] "+list[2], 580, 120);
    } else if (a == 4) {
      text("[0] "+list[0], 580, 90);
      text("[1] "+list[1], 580, 105);
      text("[2] "+list[2], 580, 120);
      text("[3] "+list[3], 580, 135);
    } else if (a == 5) {
      text("[0] "+list[0], 580, 90);
      text("[1] "+list[1], 580, 105);
      text("[2] "+list[2], 580, 120);
      text("[3] "+list[3], 580, 135);
      text("[4] "+list[4], 580, 150);
    } else if (a == 6) {
      text("[0] "+list[0], 580, 90);
      text("[1] "+list[1], 580, 105);
      text("[2] "+list[2], 580, 120);
      text("[3] "+list[3], 580, 135);
      text("[4] "+list[4], 580, 150);
      text("[5] "+list[5], 580, 165);
    } else if (a == 7) {
      text("[0] "+list[0], 580, 90);
      text("[1] "+list[1], 580, 105);
      text("[2] "+list[2], 580, 120);
      text("[3] "+list[3], 580, 135);
      text("[4] "+list[4], 580, 150);
      text("[5] "+list[5], 580, 165);
      text("[6] "+list[6], 580, 180);
    } else if (a == 8) {
      text("[0] "+list[0], 580, 90);
      text("[1] "+list[1], 580, 105);
      text("[2] "+list[2], 580, 120);
      text("[3] "+list[3], 580, 135);
      text("[4] "+list[4], 580, 150);
      text("[5] "+list[5], 580, 165);
      text("[6] "+list[6], 580, 180);
      text("[7]"+list[7], 580, 195);
    } else if (a == 9) {
      text("[0] "+list[0], 580, 90);
      text("[1] "+list[1], 580, 105);
      text("[2] "+list[2], 580, 120);
      text("[3] "+list[3], 580, 135);
      text("[4] "+list[4], 580, 150);
      text("[5] "+list[5], 580, 165);
      text("[6] "+list[6], 580, 180);
      text("[7] "+list[7], 580, 195);
      text("[8] "+list[8], 580, 210);
    } else if (a == 10) {
      text("[0] "+list[0], 580, 90);
      text("[1] "+list[1], 580, 105);
      text("[2] "+list[2], 580, 120);
      text("[3] "+list[3], 580, 135);
      text("[4] "+list[4], 580, 150);
      text("[5] "+list[5], 580, 165);
      text("[6] "+list[6], 580, 180);
      text("[7] "+list[7], 580, 195);
      text("[8] "+list[8], 580, 210);
      text("[9] "+list[9], 580, 225);
    }
  } else if (lock == true ) {

    cp5.get(Button.class, "addport").lock();
    cp5.get(Button.class, "image").unlock();
    cp5.get(Button.class, "count").unlock();
    cp5.get(Button.class, "clear").unlock();
    surface.setSize(600, 420);
  }
}

void clear() {

  clear = !clear;
}

void keyPressed() {

  if (key == 57 && s == true && x == 0) {
    j = 9;
    s = false;
    lock = true;
    myPort = new Serial(this, Serial.list()[j], 9600);
    s = false;
    lock = true;
  } else if (key == 56 && s == true && x == 0) {
    j = 8;
    myPort = new Serial(this, Serial.list()[j], 9600);
    s = false;
    lock = true;
  } else if (key == 55 && s == true && x == 0) {
    j = 7;
    myPort = new Serial(this, Serial.list()[j], 9600);
    s = false;
    lock = true;
  } else if (key == 54 && s == true && x == 0) {
    j = 6;
    myPort = new Serial(this, Serial.list()[j], 9600);
    s = false;
    lock = true;
  } else if (key == 53 && s == true && x == 0) {
    j = 5;
    myPort = new Serial(this, Serial.list()[j], 9600);
    s = false;
    lock = true;
  } else if (key == 52 && s == true && x == 0) {
    j = 4;
    myPort = new Serial(this, Serial.list()[j], 9600);
    s = false;
    lock = true;
  } else if (key == 51 && s == true && x == 0) {
    j = 3;
    myPort = new Serial(this, Serial.list()[j], 9600);
    s = false;
    lock = true;
  } else if (key == 50 && s == true && x == 0) {
    j = 2;
    myPort = new Serial(this, Serial.list()[j], 9600);
    s = false;
    lock = true;
  } else if (key == 49 && s == true && x == 0) {
    j = 1;
    myPort = new Serial(this, Serial.list()[j], 9600);
    s = false;
    lock = true;
  } else if (key == 48 && s == true && x == 0) {
    j = 0;
    myPort = new Serial(this, Serial.list()[j], 9600);
    s = false;
    lock = true;
  } else if (s == true && x == 0 && j != 0) {
    j = 0;
    myPort = new Serial(this, Serial.list()[j], 9600);
    s = false;
  }
}

void image() {
  PImage screenshot;
  i++;
  screenshot = get(50, 65, 500, 300);
  screenshot.save("M:/Desktop/image-"+i+".png");
}

void count() {
  s1 = !s1;
}


void info() {
  showMessageDialog(null,"Programm Informationen: \n\nProgrammiert von: Sebastian Danielzik \nCopyright: CC 2019 - Moonded \nWebsite: http://www.moonded.de","Informationen", INFORMATION_MESSAGE);
}
