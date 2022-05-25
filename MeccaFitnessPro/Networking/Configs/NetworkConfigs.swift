//
//  NetworkConfigs.swift
//  MeccaFitness
//
//  Created by CodeCue on 08/04/2022.
//

import Foundation

struct NetworkConfig {
    
    static let baseUrl = "http://164.92.224.155:83/api/"
    static let login = "login"
    static let register = "register"
    static let addProfileData = "professional/addProfile"
    static let viewProfileData = "view-professional-profile"
    static let updateProfileData = "professional/updateProfile"
    static let forgetPassword = "forgot-password"
    static let verifyOtp = "verify/otp"
    static let updateForgetPassword = "change-password"
    static let addCertificate = "professional/certificate"
    static let viewCertificates = "professional/certificates"
    static let deleteCertificate = "professional/certificate"
    static let addServices = "professional/services"
    static let getAllServices = "service/view_all"
    static let addTestimonial = "professional/testimonial"
    static let addPortfolio = "professional/portfolio"
    static let initialteAvailabilitiesHourse = "professional/availabilities"
    static let getProfilePercentge = "professional/profile/completionRate"
    static let updateAvailableHours = "professional/update/availabilities"
    static let professionalCategories = "professional-categories"
    static let shopCategories = "shopCategory/view_all"
    static let createShop = "shop/add"
    static let getProductCategories = "productCategory/view_all"
    static let getProductTags = "tag/view_all"
    static let getProductVariants = "variantOption/view_all"
    static let addProduct = "product/add"
    static let addProductImages = "product-images/add"
    static let getProShops = "professional/shops"
    static let getAddProductDataApi = "get-list-record"
    static let addProductVariant = "productVariant/add"
    static let deleteVariant = "productVariant/delete"
    
    
}
