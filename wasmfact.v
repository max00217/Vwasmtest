import wasm
import os

fn main() {
	mut m := wasm.Module{}
	mut fact := m.new_function('fact', [.i32_t], [.i32_t])
	{
		fact.local_get(0)
		fact.eqz(.i32_t)
		bif := fact.c_if([], [.i32_t])
		{
			fact.i32_const(1)
		}
		fact.c_else(bif)
		{
			{
				fact.local_get(0)   
			}
			{
				fact.local_get  (0)
				fact.i32_const(1)
				fact.sub(.i32_t)
				fact.call('fact')
			}
			fact.mul(.i32_t)
		}
		fact.c_end(bif)
	}
	m.commit(fact, true)
	print(m.compile().bytestr())
    mod := m.compile()

     os.write_file_array("vactorial.wasm", mod)!
}