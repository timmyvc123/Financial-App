//
//  FinancialAppTests.swift
//  FinancialAppTests
//
//  Created by Timmy Van Cauwenberge on 8/4/21.
//

import XCTest
@testable import FinancialApp

class FinancialAppTests: XCTestCase {
    
    // unit test function naming
    // what
    // given
    // expectation
    
    // unit test format
    // given
    // when
    // then
    
    // test cases
    // 1. asset = winning | dca = true
    // 2. asset = winning | dca = false
    // 3. asset = losing | dca = true
    // 4. asset = losing | dca = false
    
    var sut: DCAService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DCAService()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testDCAResult_givenDCAIsUsed_expectResult() {
        
    }
    
    func testDCAResult_givenDCAIsNotUsed_expectResult() {
        
    }
    
    func testInvesmentAmount_whenDCAIsUsed_expectResult() {
        //given
        let initialInvestmentAmount: Double = 500
        let monthlyDollarCostAveragingAmount: Double = 300
        let initalDateOfInvestmentIndex = 4 //(5 months ago)
        //when
        let investmentAmount = sut.getInvestmentAmount(initialInvestmentAmount: initialInvestmentAmount,
                                                       monthlyDollarCostAveragingAmount: monthlyDollarCostAveragingAmount,
                                                       initialDateOfInvestmentIndex: initalDateOfInvestmentIndex)
        //then
        XCTAssertEqual(investmentAmount, 1700)
        
    }
    
    func testInvestmentAmount_whenDCAIsNotUsed_expectresult() {
        //given
        let initialInvestmentAmount: Double = 500
        let monthlyDollarCostAveragingAmount: Double = 0
        let initalDateOfInvestmentIndex = 4 //(5 months ago)
        //when
        let investmentAmount = sut.getInvestmentAmount(initialInvestmentAmount: initialInvestmentAmount,
                                                       monthlyDollarCostAveragingAmount: monthlyDollarCostAveragingAmount,
                                                       initialDateOfInvestmentIndex: initalDateOfInvestmentIndex)
        //then
        XCTAssertEqual(investmentAmount, 500)
    }

    
}
