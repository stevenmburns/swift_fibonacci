import BigInt


struct fibonacci {
    func fib(n : Int) -> BigInt {
        if n < 2 {
	    return BigInt(n)
	} else {
            return fib(n: n-1) + fib(n: n-2)
	}
    }

    func hit(A: [[BigInt]], x: [BigInt]) -> [BigInt] {
        var y : [BigInt] = [BigInt(0), BigInt(0)]
	for i in 0 ..< 2 {
   	    for j in 0 ..< 2 {
                y[i] += A[i][j] * x[j]
            }
	}
        return y
    }

    func matmult(A: [[BigInt]], B: [[BigInt]]) -> [[BigInt]] {
        var C : [[BigInt]] = [[BigInt(0), BigInt(0)],[BigInt(0), BigInt(0)]]
	for i in 0 ..< 2 {
   	    for j in 0 ..< 2 {
   	        for k in 0 ..< 2 {
                    C[i][j] += A[i][k] * B[k][j]
                }
            }
	}
        return C
    }

    func power(A: [[BigInt]], n: Int) -> [[BigInt]] {
        if n == 0 {
	    return [[BigInt(1), BigInt(0)],[BigInt(0), BigInt(1)]]
	} else if n % 2 == 1 {
	    return matmult(A: power(A: A, n: n-1), B: A) 
        } else {
	    let C = power(A: A, n: n/2)
	    return matmult(A: C, B: C)
	}
    }


    func fastfib(n: Int) -> BigInt {
        let A = [[BigInt(0), BigInt(1)],[BigInt(1), BigInt(1)]]
        let x = [BigInt(0), BigInt(1)]
	return hit(A: power(A: A, n: n), x: x)[0]
    }

}
