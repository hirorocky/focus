// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// TODO: emotion#new,indexで共通化する
let shape = $('select[name="emotion[shape]"]').val();
let emo_color = $('input[name="emotion[color]"]').val();
let first_step;

function setup() {
    $('select[name="emotion[shape]"]').change(() => {
        shape = $('option:selected').val();
    });
    $('input[name="emotion[color]"]').change(() => {
        emo_color = $('input[name="emotion[color]"]').val();
    });

    let canvas = createCanvas(300,300, WEBGL);
    canvas.parent('emotion-preview');
    $("#emotion-preview canvas").css("border-radius","6px");
}

function draw() {
    background(0);

    rotateZ(frameCount * 0.001);
    rotateX(frameCount * 0.001);
    rotateY(frameCount * 0.001);

    ambientLight(50);
    pointLight(250, 250, 250, 100, 100, 30);

    stroke(emo_color);
    fill(emo_color);

    switch (shape) {
        case "1":
            sphere(80);
            break;
        case "2":
            box(80,80,80);
            break;
    }
}