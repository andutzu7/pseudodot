let r;
let g;
let b;

let amplitude = 100;
let frequency = 0.10;

let startX = 0;
let startY;

function setup() {
  const canvas = createCanvas(600, 300);
  canvas.parent('p5-container');

  startY = height / 2;
  let frequencyInput = document.getElementById("frequency_value");
  frequencyInput.addEventListener("input", function() {

	  frequency = frequencyInput.value;
  if(document.getElementById('toggleClear').checked){

	  clearCanvas();
  }

  });
  let amplitudeInput = document.getElementById("amplitude_value");
  amplitudeInput.addEventListener("input", function() {


	amplitude = amplitudeInput.value;

  if(document.getElementById('toggleClear').checked){

	  clearCanvas();
  }

  });
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

  for (let x = 0; x < width; x++) {
    point(x, startY + amplitude * sin(x*frequency));
  }

}
function clearCanvas() {
  background(32);
}
