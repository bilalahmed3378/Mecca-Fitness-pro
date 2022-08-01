//
//  Questions Apis.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 28/07/2022.
//

import Foundation
import MultipartForm

class QuestionApiCalls {
    
    static func addQuestion(question : String ,category_id : String , image : Data? = nil , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
             
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addQuestion ) else {return}
        
        var formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "question", value: question),
            MultipartForm.Part(name: "category_id", value: category_id)
        ])
        
        if(image != nil){
            formToRequest.parts.append(MultipartForm.Part(name: "image", data: image! , filename: "question_image.png"))
        }
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = formToRequest.bodyData
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    static func updateQuestion(question_id : String ,question : String ,category_id : String , image : Data? = nil , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
             
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.updateQuestion ) else {return}
        
        var formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "question", value: question),
            MultipartForm.Part(name: "category_id", value: category_id),
            MultipartForm.Part(name: "question_id", value: question_id)
        ])
        
        if(image != nil){
            formToRequest.parts.append(MultipartForm.Part(name: "image", data: image! , filename: "question_image.png"))
        }
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = formToRequest.bodyData
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    
    static func deleteQuestion(question_id : String , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
             
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.deleteQuestion + "?question_id=\(question_id)" ) else {return}
        
      
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    static func getQuestionDetails(question_id : String , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
             
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.getQuestionDetails + "?question_id=\(question_id)" ) else {return}
        
      
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }

    
    static func getQuestionsCollectiveData(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.getQuestionsCollectiveData + "?all_questions_limit=10&recent_questions_limit=10&my_questions_limit=10&popular_questions_limit=10&answered_questions_limit=10" ) else {return}
        
      
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    static func getAllQuestion(category_id : String? = nil , start_date : String? = nil , end_date : String? = nil , sort_by : String? = nil , search_query : String? = nil , user_id : String? = nil , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
        
        var urlString : String = NetworkConfig.baseUrl + NetworkConfig.getAllQuestion + "?per_page=12"
             
        if(category_id != nil){
            urlString += "&category_id=\(category_id!)"
        }
        
        if(start_date != nil && end_date != nil){
            urlString += "&start_date=\(start_date!)&end_date=\(end_date!)"
        }
        
        if(sort_by != nil){
            urlString += "&sort_by=\(sort_by!)"
        }
        
        if(user_id != nil){
            urlString += "&user_id=\(user_id!)"
        }
        
        if !((search_query ?? "").isEmpty){
            urlString += "&search_query=\(search_query!.replacingOccurrences(of: " ", with: "%20"))"
        }
        
        //Create url
        guard let url = URL(string: urlString ) else {return}
        
      
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }

    
    static func getMoreAllQuestion(url : String , category_id : String? = nil , start_date : String? = nil , end_date : String? = nil , sort_by : String? = nil , search_query : String? = nil , user_id : String? = nil , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
        
        var urlString : String = url + "&per_page=12"
             
        if(category_id != nil){
            urlString += "&category_id=\(category_id!)"
        }
        
        if(start_date != nil && end_date != nil){
            urlString += "&start_date=\(start_date!)&end_date=\(end_date!)"
        }
        
        if(sort_by != nil){
            urlString += "&sort_by=\(sort_by!)"
        }
        
        if(user_id != nil){
            urlString += "&user_id=\(user_id!)"
        }
        
        if !((search_query ?? "").isEmpty){
            urlString += "&search_query=\(search_query!.replacingOccurrences(of: " ", with: "%20"))"
        }
        
        //Create url
        guard let url = URL(string: urlString ) else {return}
        
      
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }

    
    static func addReplyToQuestion(question_id : String ,body : String , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
             
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addReplyToQuestion ) else {return}
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "question_id", value: question_id),
            MultipartForm.Part(name: "body", value: body)
        ])
      
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = formToRequest.bodyData
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    
    static func addChildReplyToQuestion(reply_id : String ,child_reply_body : String , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
             
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addChildReplyToQuestion ) else {return}
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "reply_id", value: reply_id),
            MultipartForm.Part(name: "child_reply_body", value: child_reply_body)
        ])
      
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = formToRequest.bodyData
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    static func getQuestionReplies(question_id : String , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
       
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.getQuestionReplies + "?question_id=\(question_id)&per_page=12" ) else {return}
        
      
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    
    static func getMoreQuestionReplies(url : String , question_id : String , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
       
        //Create url
        guard let url = URL(string: url + "&question_id=\(question_id)&per_page=12" ) else {return}
        
      
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    
    static func addVoteToQuestion(question_id : String ,status : String , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
             
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addUpDownVoteToQuestion ) else {return}
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "question_id", value: question_id),
            MultipartForm.Part(name: "status", value: status)
        ])
      
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = formToRequest.bodyData
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    static func addVoteToReply(question_reply_id : String ,status : String , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
             
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addUpDownVoteToQuestionReply ) else {return}
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "question_reply_id", value: question_reply_id),
            MultipartForm.Part(name: "status", value: status)
        ])
      
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = formToRequest.bodyData
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    
    static func getQuestionCategories(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
       
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.getQuestionCategories ) else {return}
        
      
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
}
