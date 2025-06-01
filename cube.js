WebAssembly.instantiateStreaming(fetch("main.wasm")).then((obj) => {console.log(obj.instance.exports.main());});

const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.fillStyle = "green";
ctx.fillRect(10, 10, 150, 100);