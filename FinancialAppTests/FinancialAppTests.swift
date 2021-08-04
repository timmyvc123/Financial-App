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
    // 1. asset = winning | dca = true -> Positive gains
    // 2. asset = winning | dca = false -> positive gains
    // 3. asset = losing | dca = true -> negative gains
    // 4. asset = losing | dca = false -> negative gains
    
    var sut: DCAService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DCAService()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testResult_givenWinningAssetAndDCAIsUsed_expectPositiveGains() {
        // given
        let initialInvestmentAmount: Double = 5000
        let monthlyDCAAmount: Double = 1500
        let initialDateOfInvestmentIndex: Int = 5
        let asset = buildWinningAsset()
        // when
        let result = sut.calculate(asset: asset, initialInvestmentAmount: initialInvestmentAmount,
                                   monthlyDollarCostAveragingAmount: monthlyDCAAmount,
                                   initialDateOfInvestmentIndex: initialDateOfInvestmentIndex)
        // then
        XCTAssertEqual(result.investmentAmount, 12500, "Investment amunt is incorrect")
        XCTAssertTrue(result.isProfitable)
        XCTAssertEqual(result.currentValue, 17342.224, accuracy: 0.1)
        XCTAssertEqual(result.gain, 4842.224, accuracy: 0.1)
        XCTAssertEqual(result.yield, 0.3873, accuracy: 0.0001)
    }
    
    func testResult_givenWinningAssetAndDCAIsNotUsed_expectPositiveGains() {
        
    }
    
    func testResult_givenLosingAssetAndDCAIsUsed_expectNegativeGains() {
        
    }
    
    func testResult_givenLosingAssetAndDCAIsNotUsed_expectNegativeGains() {
        
    }
    
    private func buildWinningAsset() -> Asset {
        let searchResult = buildSearchresult()
        let meta = buildMeta()
        let timeSeries: [String : OHLC] = ["2021-01-25" : OHLC(open: "100", close: "110", adjustedClose: "110"),
                                           "2021-02-25" : OHLC(open: "110", close: "120", adjustedClose: "120"),
                                           "2021-03-25" : OHLC(open: "120", close: "130", adjustedClose: "130"),
                                           "2021-04-25" : OHLC(open: "130", close: "140", adjustedClose: "140"),
                                           "2021-05-25" : OHLC(open: "140", close: "150", adjustedClose: "150"),
                                           "2021-06-25" : OHLC(open: "150", close: "160", adjustedClose: "160")]
        let timeSeriesMonthlyAdjusted = TimeSeriesMonthlyAdjusted(meta: meta, timeSeries: timeSeries)
        
        return Asset(searchResult: searchResult,
                     timeSeriesMonthlyAdjusted: timeSeriesMonthlyAdjusted)
    }
    
    private func buildSearchresult() -> SearchResult {
        return SearchResult(symbol: "XYZ", name: "XYZ Company", type: "ETF", currency: "USD")
    }
    
    private func buildMeta() -> Meta {
        return Meta(symbol: "XYZ")
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
