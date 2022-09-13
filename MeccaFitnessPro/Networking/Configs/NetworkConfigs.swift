//
//  NetworkConfigs.swift
//  MeccaFitness
//
//  Created by CodeCue on 08/04/2022.
//

import Foundation

struct NetworkConfig {
    
//    static let baseUrl = "http://164.92.224.155:83/api/"
    static let baseUrl = "https://www.meccafitness.org/api/"

    static let login = "login"
    static let register = "register"
    static let addProfileData = "professional/addProfile"
    static let logout = "logout"
    static let viewProfileData = "view-professional-profile"
    static let viewUserProfileData = "user/viewProfile"
    static let forgetPassword = "forgot-password"
    static let verifyOtp = "verify/otp"
    static let updateForgetPassword = "change-password"
    static let addCertificate = "professional/certificate"
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
    static let updateShop = "shop/update"
    static let getProductCategories = "productCategory/view_all"
    static let getProductTags = "tag/view_all"
    static let getProductVariants = "variantOption/view_all"
    static let addProduct = "product/add"
    static let addProductImages = "product-images/add"
    static let getProShops = "professional/shops"
    static let getAllShops = "shop/view-all"
    static let getAddProductDataApi = "get-list-record"
    static let addProductVariant = "productVariant/add"
    static let deleteVariant = "productVariant/delete"
    static let deleteProductImage = "product-images/delete"
    static let updateProduct = "product/update"
    static let addProMedia = "professional/media"
    static let removeMedia = "professional/media"
    static let updateProfile = "professional/updateProfile"
    static let viewServices = "professional/services"
    static let deleteServices = "professional/service"
    static let getCertificates = "professional/certificates"
    static let deleteCertificate = "professional/certificate"
    static let getTestimonials = "professional/testimonials"
    static let deleteTestimonial = "professional/testimonial"
    static let getPortfolios = "professional/portfolios"
    static let deletePortfolio = "professional/portfolio"
    static let viewMedia = "professional/media"
    static let deleteMedia = "professional/media"
    static let viewShopDetails = "shop/view"
    static let viewShopPARProducts = "get-shop-products-lists"
    static let viewShopPoupularProducts = "get-shop-popular-products"
    static let getEventCategories = "eventCategory/view-all"
    static let addEvent = "event/add"
    static let viewAllEvents = "event/view-all"
    static let getEventDetails = "event/view"
    static let addEventComment = "event/add-comment"
    static let getEventComments = "event/view-comments"
    static let addCommentReply = "event/add-child-comment"
    static let joinEvent = "join-event"
    static let allEvents = "event/view-all"
    static let deleteEvent = "event/delete"
    static let deleteShop = "shop/delete"
    static let deleteProduct = "product/delete"
    static let changeEventStatus = "event/change-status"
    static let updateEvent = "event/update"
    static let getMeccaMarketHome = "get-collective-limited-products-shops"
    static let allPopularProducts = "get-all-popular-products"
    static let getProductDetails = "product/view"
    static let getProductImages = "product-images/view"
    static let addToCart = "add-to-cart"
    static let getDeviceCart = "view-device-carts"
    static let updateCart = "update-cart"
    static let addBillingAddress = "BillingAddress/add"
    static let viewBillingAddress = "BillingAddress/view"
    static let viewAllBillingAddresses = "get-user-billing-addresses"
    static let updateBillingAddress = "BillingAddress/update"
    static let deleteBillingAddress = "BillingAddress/delete"
    static let viewAllShippingAddresses = "get-user-shipping-addresses"
    static let addShippingAddress = "ShippingAddress/add"
    static let updateShippingAddress = "ShippingAddress/update"
    static let deleteShippingAddress = "ShippingAddress/delete"
    static let checkout = "checkout"
    static let getBlogsCollectiveData = "get-blogs-collective-data"
    static let getBlogDetails = "blog/view"
    static let viewAllBlogs = "blog/view-all"
    static let getBlogCatgories = "blogCategory/view-all"
    static let getBlogsByCatgory = "get-category-specific-blogs"
    static let addLikeDislikeBlogApi = "blog/add-like-dislike-status"
    static let viewBlogComments = "blog/view-comments"
    static let addCommentToBlog = "blog/add-comment"
    static let addReplyToBlogComment = "blog/add-child-comment"
    static let orders = "orders"
    static let getOrderDetails = "order/view"
    static let changeOrderStatus = "order/update-status"
    static let proShopsAndCustomers = "professional/shops-customers-list"
    static let addQuestion = "quoraQuestion/add"
    static let getQuestionDetails = "quoraQuestion/view"
    static let updateQuestion = "quoraQuestion/update"
    static let deleteQuestion = "quoraQuestion/delete"
    static let getAllQuestion = "quoraQuestion/view-all"
    static let getQuestionReplies = "quoraQuestion/view-replies"
    static let addReplyToQuestion = "quoraQuestion/add-reply"
    static let addChildReplyToQuestion = "quoraQuestion/add-child-reply"
    static let addUpDownVoteToQuestion = "quoraQuestion/add-upvote-downvote-status"
    static let addUpDownVoteToQuestionReply = "quoraQuestionReply/add-upvote-downvote-status"
    static let getQuestionCategories = "quoraCategory/view-all"
    static let getQuestionsCollectiveData = "quoraQuestion/collective-data"
    static let getShopRattingAndReview = "shop/view-ratings"
    static let getProductRatingAndReview = "product/view-ratings"
    static let getHomeData = "professional/homepage"
    static let getAllProfessionalCategories = "professional-categories"
    static let getAllProfessionals = "get-all-professionals"
    static let getAllCustomers = "get-all-users"
    static let getAllProducts = "product/view-all"
    static let viewProfessionalRatingsAndReviews = "professional/view-ratings"

}
