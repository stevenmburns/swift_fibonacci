import BigInt

struct fibonacci {
  func fibTroll(n: Int) -> BigInt {
    if n < 2 {
      return BigInt(n)
    } else {
      return fibTroll(n: n - 1) + fibTroll(n: n - 2)
    }
  }

  func fibAcceptable(n: Int) -> BigInt {
    var a: [BigInt] = [BigInt(0), BigInt(1)]

    if n >= 2 {
      for i in 2...n {
        a.append(a[i - 1] + a[i - 2])
      }
    }

    return a[n]
  }

  func fibExceedsExpectations(n: Int) -> BigInt {
    var a = BigInt(0)
    var b = BigInt(1)

    if n == 0 {
      return a
    } else if n == 1 {
      return b
    } else {
      for i in 2...n {
        (a, b) = (b, a + b)
      }
    }

    return b
  }

  func hit(A: [[BigInt]], x: [BigInt]) -> [BigInt] {
    var y: [BigInt] = [BigInt(0), BigInt(0)]
    for i in 0..<2 {
      for j in 0..<2 {
        y[i] += A[i][j] * x[j]
      }
    }
    return y
  }

  func matmult(A: [[BigInt]], B: [[BigInt]]) -> [[BigInt]] {
    var C: [[BigInt]] = [[BigInt(0), BigInt(0)], [BigInt(0), BigInt(0)]]
    for i in 0..<2 {
      for j in 0..<2 {
        for k in 0..<2 {
          C[i][j] += A[i][k] * B[k][j]
        }
      }
    }
    return C
  }

  func power(A: [[BigInt]], n: Int) -> [[BigInt]] {
    if n == 0 {
      return [[BigInt(1), BigInt(0)], [BigInt(0), BigInt(1)]]
    } else if n % 2 == 1 {
      return matmult(A: power(A: A, n: n - 1), B: A)
    } else {
      let C = power(A: A, n: n / 2)
      return matmult(A: C, B: C)
    }
  }

  func powerIterative(A: [[BigInt]], n: Int) -> [[BigInt]] {

    var m = n

    var R = [[BigInt(1), BigInt(0)], [BigInt(0), BigInt(1)]]
    var S = A
    while m > 0 {
      if m % 2 == 1 {
        R = matmult(A: R, B: S)
        m -= 1
      } else {
        S = matmult(A: S, B: S)
        m /= 2
      }
    }

    return R
  }

  func fibOutstanding(n: Int) -> BigInt {
    let A = [[BigInt(0), BigInt(1)], [BigInt(1), BigInt(1)]]
    let x = [BigInt(0), BigInt(1)]
    if n == 0 {
      return BigInt(0)
    } else {
      return hit(A: powerIterative(A: A, n: n - 1), x: x)[1]
    }
  }

}
