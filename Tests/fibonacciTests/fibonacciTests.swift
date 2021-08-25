    import XCTest
    import BigNum
    @testable import fibonacci

    final class fibonacciTests: XCTestCase {
        func testExample() {
            XCTAssertEqual(fibonacci().fib(n:0), BigInt(0))
            XCTAssertEqual(fibonacci().fib(n:1), BigInt(1))
            XCTAssertEqual(fibonacci().fib(n:2), BigInt(1))
            XCTAssertEqual(fibonacci().fib(n:3), BigInt(2))
            XCTAssertEqual(fibonacci().fib(n:4), BigInt(3))
            XCTAssertEqual(fibonacci().fib(n:5), BigInt(5))
            XCTAssertEqual(fibonacci().fib(n:6), BigInt(8))
            XCTAssertEqual(fibonacci().fib(n:7), BigInt(13))

	    for n in 0 ..< 8 {
	        XCTAssertEqual(fibonacci().fastfib(n: n), fibonacci().fib(n: n))
	    }
        }
    }
