let x;
let y;

let r;
let g;
let b;

function setup() {
  const canvas = createCanvas(600, 300);
  canvas.parent('p5-container');

  r = random(255);
  g = random(255);
  b = random(255);

  background(32);
}

function draw() {


  r += random(-10, 10);
  g += random(-10, 10);
  b += random(-10, 10);
  r = constrain(r, 0, 255);
  g = constrain(g, 0, 255);
  b = constrain(b, 0, 255);

  stroke(r, g, b);
  let startX = 0;
  let startY = height / 2;
  let wavelength = 200; // Adjust the wavelength of the sine wave
  let amplitude = 100;   // Adjust the amplitude of the sine wave
  let frequency = 0.10; // Adjust the frequency of the sine wave

  for (let x = 0; x < width; x++) {
    point(x, startY + amplitude * sin(x*frequency));
  }

  //let startX = 0;
  //let startY = height / 2;
  //let amplitude = 100;   // Adjust the amplitude of the sine wave
  //let angleStep = 1;    // Adjust the angle step (in degrees)
//
  //for (let angle = 0; angle <= 720; angle += angleStep) {
    //let x = startX + angle;
    //let radiansAngle = radians(angle);
    //let y = startY + amplitude * sin(radiansAngle);
    //point(x, y);
}
//
  //for (let angle = 0; angle <= 720; angle += angleStep) {
    //let x = startX + angle;
    //let radiansAngle = radians(angle);
    //let y = (startY - amplitude * sin(radiansAngle));
    //point(x, y);
//}
//}
