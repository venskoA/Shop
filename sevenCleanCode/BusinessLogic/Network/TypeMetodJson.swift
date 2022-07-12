//
//  TypeMetods.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 23.06.22.
//

import Foundation

protocol TypeMetodJsonProtocol {
    static var login: String { get set }
    static var lodout: String { get set }
    static var reist: String { get set }
    static var change: String { get set }
    static var listProduct: String { get set }
    static var addReview: String { get set }
    static var removeReview: String { get set }
    static var getBasketProduct: String { get set }

    static var addProduct: String { get set }
    static var removeProduct: String { get set }
    static var payForProduct: String { get set }
}

struct TypeMetodJsonStruct: TypeMetodJsonProtocol {
    static var login: String = "/GeekBrainsTutorial/online-store-api/master/responses/login.json"
    static var lodout: String = "/GeekBrainsTutorial/online-store-api/master/responses/logout.json"
    static var reist: String = "/GeekBrainsTutorial/online-store-api/master/responses/registerUser.json"
    static var change: String = "/GeekBrainsTutorial/online-store-api/master/responses/changeUserData.json"

    static var listProduct: String = "/GeekBrainsTutorial/online-store-api/master/responses/catalogData.json"

    static var addReview: String = "/GeekBrainsTutorial/online-store-api/master/responses/addReview.json"
    static var listReview: String = "/GeekBrainsTutorial/online-store-api/master/responses/listReview.json"

    static var removeReview: String = "/GeekBrainsTutorial/online-store-api/master/responses/removeReview.json"
    static var getBasketProduct: String = "/GeekBrainsTutorial/online-store-api/master/responses/getBasket.json"

    static var addProduct: String = "/GeekBrainsTutorial/online-store-api/master/responses/addToBasket.json"
    static var removeProduct: String = "/GeekBrainsTutorial/online-store-api/master/responses/deleteFromBasket.json"
    static var payForProduct: String = "/GeekBrainsTutorial/online-store-api/master/responses/payBasket.json"
}

enum TypeMetodJson: String {
    case login = "/GeekBrainsTutorial/online-store-api/master/responses/login.json"
    case lodout = "/GeekBrainsTutorial/online-store-api/master/responses/logout.json"
    case reist = "/GeekBrainsTutorial/online-store-api/master/responses/registerUser.json"
    case change = "/GeekBrainsTutorial/online-store-api/master/responses/changeUserData.json"

    case listProduct = "/GeekBrainsTutorial/online-store-api/master/responses/catalogData.json"

    case addReview = "/GeekBrainsTutorial/online-store-api/master/responses/addReview.json"
    case listReview = "/GeekBrainsTutorial/online-store-api/master/responses/listReview.json"
    case removeReview = "/GeekBrainsTutorial/online-store-api/master/responses/removeReview.json"

    case getBasketProduct = "/GeekBrainsTutorial/online-store-api/master/responses/getBasket.json"
    case addProduct = "/GeekBrainsTutorial/online-store-api/master/responses/addToBasket.json"
    case removeProduct = "/GeekBrainsTutorial/online-store-api/master/responses/deleteFromBasket.json"
    case payForProduct = "/GeekBrainsTutorial/online-store-api/master/responses/payBasket.json"
}

