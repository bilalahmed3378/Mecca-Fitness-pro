//
//  LoginScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 13/02/2022.
//
import SwiftUI
import FacebookCore
import FacebookLogin
import FacebookShare
import GoogleSignIn

struct LoginScreen: View {
    
    @ObservedObject var loginApi : LoginApi = LoginApi()
    
    @StateObject var fbmanager = fbLoginManager()

    
    @Environment(\.presentationMode) var presentationMode
    
    @State var email : String = "kefose7903@lurenwu.com"
    @State var password : String = "Aa12345678@"
    @State var showToast : Bool = false
    @State var toastMessage : String = "" 
    @State var showPassword : Bool = false
    @State var remmberMe : Bool = false
    @Binding var pushToLogin : Bool
    
    @Binding var isUserLoggedIn : Bool
    
    @State var forgetPasswordActive : Bool = false
    
    @Binding var isProfileSetUp : Bool

    
    init (pushToLogin : Binding<Bool> , isUserLoggedIn : Binding<Bool>  , isProfileSetUp : Binding<Bool>){
        self._pushToLogin = pushToLogin
        self._isUserLoggedIn = isUserLoggedIn
        self._isProfileSetUp = isProfileSetUp
    }
    
//    UIScrollView.appearance().bounces = false
    var body: some View {
        
        ZStack{
            
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    
                    Spacer()
                        .frame(height:30)
                    
                    Group{
                        // image
                        Image(AppImages.loginImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                        
                        Text("Mecca of Fitness")
                            .font(AppFonts.ceraPro_18)
                            .fontWeight(.bold)
                    }
                    
                    
                    Group{
                        
                        TextField("Username or email", text: self.$email)
                            .font(AppFonts.ceraPro_14)
                            .autocapitalization(.none)
                            .foregroundColor(.black)
                            .padding()
                            .background(AppColors.grey200)
                            .cornerRadius(10)
                            .padding(.top,30)
                            .onChange(of: self.email) { newValue in
                                self.email = newValue.limit(limit : 40)
                            }
                        
                        
                        if(self.showPassword){
                            TextField("Password", text: self.$password)
                                .font(AppFonts.ceraPro_14)
                                .autocapitalization(.none)
                                .foregroundColor(.black)
                                .padding()
                                .background(AppColors.grey200)
                                .overlay(HStack{
                                    Spacer()
                                    Button(action: {
                                            self.showPassword.toggle()
                                        
                                    }){
                                        Image(systemName: "eye.slash.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(AppColors.textColor)
                                            
                                    }
                                    .padding(.trailing,10)
                                })
                                .cornerRadius(10)
                                .padding(.top,10)
                                .onChange(of: self.password) { newValue in
                                    self.password = newValue.limit(limit : 40)
                                }
                        }
                        else{
                            SecureField("Password", text: $password)
                                .font(AppFonts.ceraPro_14)
                                .autocapitalization(.none)
                                .foregroundColor(.black)
                                .padding()
                                .background(AppColors.grey200)
                                .overlay(HStack{
                                    Spacer()
                                    Button(action: {
                                      
                                            self.showPassword.toggle()
                                        
                                    }){
                                        Image(systemName: "eye.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(AppColors.textColor)
                                            
                                    }
                                    .padding(.trailing,10)
                                })
                                .cornerRadius(10)
                                .padding(.top,10)
                                .onChange(of: self.password) { newValue in
                                    self.password = newValue.limit(limit : 40)
                                }
                        }
                        
                        
                        HStack{
                            
                            Spacer()
                            
                            Button(action: {
                                withAnimation{
                                    self.remmberMe.toggle()
                                }
                            }){
                                
                                Image(systemName: self.remmberMe ? "checkmark.square.fill" : "square")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(self.remmberMe ? AppColors.primaryColor : Color.black)
                                
                            }
                            
                            Text("Remmber me")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                            
                        }
                        .padding(.top,10)
                        
                    }
                    
                    
                    NavigationLink(destination: ForgetPasswordScreen(forgetPasswordActive: self.$forgetPasswordActive), isActive: $forgetPasswordActive){
                        HStack{
                            Spacer()
                            Text("Forgot your password?")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .onTapGesture(perform: {
                                    if !(loginApi.isLoading){
                                        self.forgetPasswordActive = true
                                    }
                                })
                        }
                        .padding(.top,10)
                    }
                    
                    
                    
                    
                    Group{
                        
                        if(self.loginApi.isLoading){
                            HStack{
                                ProgressView()
                            }
                            .padding()
                        }
                        else{
                            
                            Button(action: {
                                
                                if(self.email.isEmpty){
                                    self.toastMessage = "Please enter email."
                                    self.showToast = true
                                }
                                else if(self.password.isEmpty){
                                    self.toastMessage = "Please enter password."
                                    self.showToast = true
                                }
                                else{
                                    
                                    self.loginApi.loginUser(email: self.email, password: self.password)
                                    
                                }
                                
                            }){
                                GradientButton(lable: "Login")
                                
                            }
                            .onAppear{
                                if(self.loginApi.isApiCallDone && self.loginApi.isApiCallSuccessful){
                                    
                                    if(self.loginApi.loginSuccessful){
                                        
                                        if(self.loginApi.apiResponse!.data!.user!.user_type == "professional"){
                                            
                                            if(self.loginApi.apiResponse!.data!.user!.email_verified_at == nil){
                                                
                                                AppData().setEmailVerfied(verfied:false)
                                                
                                                self.toastMessage = "Email not verified. Please first verify your email."
                                                self.showToast = true
                                            }
                                            else if(self.loginApi.apiResponse!.data!.user!.is_profile_setup == 0){
                                                AppData().setEmailVerfied(verfied:true)
                                                AppData().setRemeberMe(rememberMe: self.remmberMe)
                                                if(self.remmberMe){
                                                    AppData().saveRememberMeData(email: self.email, password: self.password)
                                                }
                                                AppData().userLoggedIn()
                                                AppData().saveUserDetails(user: self.loginApi.apiResponse!.data!.user!)
                                                withAnimation{
                                                    self.isProfileSetUp = true
                                                    self.isUserLoggedIn = true
                                                }
                                            }
                                            else{
                                                AppData().setRemeberMe(rememberMe: self.remmberMe)
                                                if(self.remmberMe){
                                                    AppData().saveRememberMeData(email: self.email, password: self.password)
                                                }
                                                AppData().userLoggedIn()
                                                AppData().saveUserDetails(user: self.loginApi.apiResponse!.data!.user!)
                                                withAnimation{
                                                    self.isProfileSetUp = false
                                                    self.isUserLoggedIn = true
                                                }
                                            }
                                        }
                                        else{
                                            self.toastMessage = "Email or password incorrent"
                                            self.showToast = true
                                        }
                                    }
                                    else{
                                        self.toastMessage = "Email or password incorrent"
                                        self.showToast = true
                                    }
                                }
                                else if(self.loginApi.isApiCallDone && (!self.loginApi.isApiCallSuccessful)){
                                    self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                    self.showToast = true
                                }
                            }
                            
                        }
                        
                    }
                    .padding(.top,20)
                    
                    
                    
                    
                    HStack{
                        Text(" Don’t have an account?")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                        
                        Button(action: {
                            if !(self.loginApi.isLoading){
                                withAnimation{
                                    self.pushToLogin.toggle()
                                }
                            }
                        }){
                            Text("Signup")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.gradientRedColor)
                        }
                        
                        
                        
                    }
                    .padding(.top,10)
                    
                    
                    
                    
                    Text("or log in with")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding(.top,15)
                    
                    
                    
                    
                    HStack(spacing: 0.0){
                       
                        
                        Button{
                                      handleSignInButton()
                                    } label:{
                                      Image(uiImage: UIImage(named: AppImages.googleSvg)!)
                                    }
                                    Button{
                                      self.fbmanager.facebookLogin()
                                    } label:{
                                      Image(uiImage: UIImage(named: AppImages.facebookSvg)!)
                                    }
                        
                        
                       
                    }
                    .padding(.top,10)
                    
                    
                    
                    VStack{
                        
                        Text("By using Meeca of Fitness you agree to our")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                        
                        
                        HStack{
                        NavigationLink(destination: {
                           TermsAndConditionScreen()
                        }, label: {
                            Text("Term of Service")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.gradientRedColor)
                        })
                           
                            
                            Text("and")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                            
                            NavigationLink(destination: {
                                PrivacyScreen()
                            }, label: {
                                Text("Privacy Policy")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.gradientRedColor)
                                
                                
                            })
                            
                        }
                        
                    }
                     
                    
//                    Text("By using Meeca of Fitness you agree to our \(Text("Term of Service").foregroundColor(AppColors.gradientRedColor)) and \(Text("Privacy Policy").foregroundColor(AppColors.gradientRedColor)).")
//                        .font(AppFonts.ceraPro_14)
//                        .foregroundColor(.black)
//                        .padding(.top,15)
//                        .multilineTextAlignment(.center)
                    
                    
                    
                    Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
            }
            
            if(showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }
        .navigationBarHidden(true)
        .onAppear{
            let appData = AppData()
            self.remmberMe = appData.isRememberMe()
            if(self.remmberMe){
                self.email = appData.getUserEmail()
                self.password = appData.getUserPassword()
            }
            
        }
        
        
        
    }
}


class fbLoginManager: ObservableObject {
  let loginManager = LoginManager()
  func facebookLogin() {
    loginManager.logIn(permissions: [.publicProfile, .email], viewController: nil) { loginResult in
      switch loginResult {
      case .failed(let error):
        print(error)
      case .cancelled:
        print("User cancelled login.")
      case .success(let grantedPermissions, let declinedPermissions, let accessToken):
        print("Logged in! \(grantedPermissions) \(declinedPermissions) \(accessToken)")
        GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name"]).start(completionHandler: { (connection, result, error) -> Void in
          if (error == nil){
            let fbDetails = result as! NSDictionary
            print(fbDetails)
          }
        })
      }
    }
  }
}


extension LoginScreen{
  func handleSignInButton() {
    let signInConfig = GIDConfiguration(clientID: "495032594798-dfrrlt0oj2jvadp6easj2t44qebebkic.apps.googleusercontent.com")
    guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
    GIDSignIn.sharedInstance.signIn(
      with: signInConfig,
      presenting: presentingViewController) { user, error in
        guard let signInUser = user else {
          // Inspect error
          return
        }
        // If sign in succeeded, display the app's main content View.
      }
    //    )
  }
}



