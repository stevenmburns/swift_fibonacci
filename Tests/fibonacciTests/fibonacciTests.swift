    import XCTest
    import BigNum
    @testable import fibonacci

    final class fibonacciTests: XCTestCase {
        func testExample() {
            XCTAssertEqual(fibonacci().fibTroll(n:0), BigInt(0))
            XCTAssertEqual(fibonacci().fibTroll(n:1), BigInt(1))
            XCTAssertEqual(fibonacci().fibTroll(n:2), BigInt(1))
            XCTAssertEqual(fibonacci().fibTroll(n:3), BigInt(2))
            XCTAssertEqual(fibonacci().fibTroll(n:4), BigInt(3))
            XCTAssertEqual(fibonacci().fibTroll(n:5), BigInt(5))
            XCTAssertEqual(fibonacci().fibTroll(n:6), BigInt(8))
            XCTAssertEqual(fibonacci().fibTroll(n:7), BigInt(13))

	    for n in 0 ..< 8 {
	        XCTAssertEqual(fibonacci().fibOutstanding(n: n), fibonacci().fibTroll(n: n))
	    }

	    for n in 0 ..< 1000 {

		let outstanding = fibonacci().fibOutstanding(n: n)
		let exceedsExpectations = fibonacci().fibExceedsExpectations(n: n)
		let acceptable = fibonacci().fibAcceptable(n: n)
	        XCTAssertEqual(outstanding, acceptable)
	        XCTAssertEqual(outstanding, exceedsExpectations)
	        print( "fib for \(n) is \(outstanding)")

	    }

	    func timeIt( f: () -> BigInt) -> BigInt {
                let start = DispatchTime.now()
                let result = f()
                let end = DispatchTime.now()
                let elapsed_time = end.uptimeNanoseconds - start.uptimeNanoseconds
                print("Time is \(elapsed_time)")
                return result
	    }

	    let n = 100000

	    let outstanding = timeIt() { () -> BigInt in fibonacci().fibOutstanding(n: n) }
	    let exceedsExpectations = timeIt() { () -> BigInt in fibonacci().fibExceedsExpectations(n: n) }
	    let acceptable = timeIt() { () -> BigInt in fibonacci().fibAcceptable(n: n) }


            XCTAssertEqual(outstanding, exceedsExpectations)
            XCTAssertEqual(outstanding, acceptable)


        }
    }
