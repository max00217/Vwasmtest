import wasm
import os
//WIP
fn main() {
	mut m := wasm.Module{}
	mut fibo := m.new_function('fibo', [.i32_t], [.i32_t]) {
		fibo.i32_const(0)
		fibo.i32_const(0)
		fibo.i32_const(2)
	}
	m.commit(fibo, true)
	print(m.compile().bytestr())
    mod := m.compile() // []u8

	// v run facttorial.v > a.wasm
	// wasmer a.wasm -i fact 5
     os.write_file_array("vibonacci.wasm", mod)!
}

fn fibo(n i64) {
	mut r := 0
	mut n1 := 0
	mut n2 := 1

	if n <= 1 {
		println(n)
	} else {
		for _ in 0..n {
			r = n1 + n2
			n1 = n2
			n2 = r
			println(r)
		}
		// println(r)
	}
}