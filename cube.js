WebAssembly.instantiateStreaming(fetch("main.wasm")).then(
  (obj) => {
    // Do something with the results!
	console.log(obj.instance.exports.main());
  },
);
