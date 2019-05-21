// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// TODO: emotion#new,indexで共通化する
let shape = $('select[name="emotion[shape]"]').val();
let emo_color = $('input[name="emotion[color]"]').val();

function setup() {
    $('select[name="emotion[shape]"]').change(() => {
        shape = $('option:selected').val();
    });
    $('input[name="emotion[color]"]').change(() => {
        emo_color = $('input[name="emotion[color]"]').val();
    });

    let canvas = createCanvas(300,300, WEBGL);
    canvas.parent('emotion-preview');
}

function draw() {
    background(250);

    rotateZ(frameCount * 0.001);
    rotateX(frameCount * 0.001);
    rotateY(frameCount * 0.001);

    stroke(emo_color);
    fill(emo_color);
    console.log(shape);
    switch (shape) {
        case "1":
            sphere(80);
            break;
        case "2":
            box(80,80,80);
            break;
    }
}