//
//  TypeMetods.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 23.06.22.
//

import Foundation

enum TypeMetodJson: String {

    //MARK: my castom remote API
    case login = "/postLogin"
    case reist = "/postRegister"

    case listProduct = "/catalogData"

    case addReview = "/addReview"
    case listReview = "/listReview"
    case removeReview = "/removeReview"

    case getBasketProduct = "/getBasket"
    case addProduct = "/addToBasket"
    case removeProduct = "/deleteFromBasket"
    case payForProduct = "/payBasket"


    //MARK: remote API
    case lodout = "/GeekBrainsTutorial/online-store-api/master/responses/logout.json"
    case change = "/GeekBrainsTutorial/online-store-api/master/responses/changeUserData.json"

    //MARK: reserv API
    //    case lodout = "postlogout"
    //    case change = "/changeUserData"

    //    case login = "/GeekBrainsTutorial/online-store-api/master/responses/login.json"
    //    case reist = "/GeekBrainsTutorial/online-store-api/master/responses/registerUser.json"

    //    case listProduct = "/GeekBrainsTutorial/online-store-api/master/responses/catalogData.json"

    //    case addReview = "/GeekBrainsTutorial/online-store-api/master/responses/addReview.json"
    //    case listReview = "/GeekBrainsTutorial/online-store-api/master/responses/listReview.json"
    //    case removeReview = "/GeekBrainsTutorial/online-store-api/master/responses/removeReview.json"

    //    case getBasketProduct = "/GeekBrainsTutorial/online-store-api/master/responses/getBasket.json"
    //    case addProduct = "/GeekBrainsTutorial/online-store-api/master/responses/addToBasket.json"
    //    case removeProduct = "/GeekBrainsTutorial/online-store-api/master/responses/deleteFromBasket.json"
    //    case payForProduct = "/GeekBrainsTutorial/online-store-api/master/responses/payBasket.json"
}

