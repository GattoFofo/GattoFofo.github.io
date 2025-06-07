(module
	(memory (export "memory") 4)
	
	(func (export "func") (param $w i32) (param $h i32)
		;; create a local variable and initialize it to 0
		(local $x i32)
		(local $y i32)
		(local $p i32)
		
		(loop $loop1
			;; clear x
			i32.const 0
			local.set $x
			(loop $loop0
				;; position
				(i32.mul (local.get $y) (local.get $w))
				local.get $x
				i32.add
				i32.const 4
				i32.mul
				local.set $p
				local.get $p
				;; data
				(i32.mul (local.get $y) (i32.const 256))
				local.get $x
				i32.add
				i32.const 4278190080
				i32.add
				i32.store
				
				;; add 1 to $x
				(i32.add (local.get $x) (i32.const 1))
				local.set $x
				
				;; if $x < $w go loop
				(i32.lt_s (local.get $x) (local.get $w))
				br_if $loop0
			)
			;; add 1 to $y
			(i32.add (local.get $y) (i32.const 1))
			local.set $y
			
			;; if $y < $h go loop
			(i32.lt_s (local.get $y) (local.get $h))
			br_if $loop1
		)
	)
)