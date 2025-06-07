const main = WebAssembly.instantiateStreaming(fetch("main.wasm"));

const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
const width = 256;
const height = 256;

canvas.width = width;
canvas.height = height;

main.then(({instance: {exports}}) => {
	exports.func(width, height);
	ctx.putImageData(new ImageData(new Uint8ClampedArray(exports.memory.buffer, 0, 4 * width * height), width), 0, 0);
});