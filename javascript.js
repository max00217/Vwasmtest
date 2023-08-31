async function loadWasm(url) {
    const wasmModule = await WebAssembly.instantiateStreaming(fetch(url), {});
    return wasmModule.instance;
}

async function factorial() {
    const vwasm = "vactorial.wasm";
    const vwasminstance = await loadWasm(vwasm);

    const inputfact = document.getElementById("inputfact");
    const num = inputfact.value;

    const factresult = vwasminstance.exports.fact(num);
    const resultElement = document.getElementById("factresult");
    resultElement.innerHTML = num + "! = " + factresult;
}

async function add() {
    const wasmUrl = "v.wasm";
    const wasmInstance = await loadWasm(wasmUrl); 

    const inputadd = document.getElementById("inputadd");
    const inputadd2 = document.getElementById("inputadd2");

    const add = inputadd.value;
    const add2 = inputadd2.value;

    const addresult = wasmInstance.exports.add(add, add2);
    const addresultel = document.getElementById("addresult");
    addresultel.innerHTML = add + "+" + add2 + "=" + addresult;
}

// main(); 

// factorial();