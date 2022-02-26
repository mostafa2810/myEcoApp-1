import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/services/firestore_user.dart';
import 'package:ecommerce/view/auth/verify_otp.dart';
import 'package:ecommerce/view/home/controll_view.dart';
import 'package:ecommerce/view/home/home_view.dart';
import 'package:ecommerce/view/owner/owner_home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

//getx Support disaple automatically

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  String email, password, name,phone ,codeV,code;
  // TextEditingController email1,pass1,name1,code1;
  var verificationId;
  Rx<User> _user = Rx<User>();
  get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


Future<void> sginInWithGoogle() async /* Sgin in with google method*/
  {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  }

  Future<void> googleSignInMehtod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
 print("cc=" + googleUser.toString());
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    print("cc=" + credential.toString());
    //UserCredential userCredential=
    await _auth.signInWithCredential(credential).then((user) async {
      await FireStoreUser().getCurrentUser(user.user.uid).then((value) {
        setUser(UserModel.fromJson(value.data()));
        print("Userr = " + _user.toString());
      });
      saveUser(user);
    });
    Get.offAll(HomeView());
  }

  void facebookSihnInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    final accessToken = result.accessToken.token;
    if (result.status == FacebookLoginStatus.loggedIn) {
      final faceCredintal = FacebookAuthProvider.credential(accessToken);

      await _auth
          .signInWithCredential(faceCredintal)
          .then((value) async => {saveUser(user)});
      Get.offAll(HomeView());
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user.uid).then((value) {
          setUser(UserModel.fromJson(value.data()));
          print("Userr = " + _user.toString());
        });
      });
      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar("Error login Acoount", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void brandsignInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user.uid).then((value) {
          setUser(UserModel.fromJson(value.data()));
          print("Userr = " + _user.toString());
        });
      });
      Get.offAll(OwnerHomeView(
        email:email,
        pass:password,
      ));
    } catch (e) {
      Get.snackbar("Error login Acoount", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Future signInWithPhoneAndPassword() async {
  //   UserCredential userCredential = await confirmationResult.confirm('123456');
  //   try {
  //    // ConfirmationResult confirmationResult =
  //     await _auth.signInWithCredential()
  //     // _auth.signInWithPhoneNumber('+201097970465',
  //     //     RecaptchaVerifier(
  //     //   container: 'recaptcha',
  //     //
  //     //   size: RecaptchaVerifierSize.compact,
  //     //   theme: RecaptchaVerifierTheme.dark,
  //     // ));
  //   } catch (e) {
  //     print("eee="+e.toString());
  //     Get.snackbar("Error login Acoount", e.message,
  //         colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
  //   }
  // }



  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      await Firestore.instance.collection('users').add({
        'name': name,
        'email': email,
      });
      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar("Error login Acoount", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithPhoneAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      await Firestore.instance.collection('users').add({
        'name': name,
        'email': email,
      });
      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar("Error login Acoount", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }


  Future verifyPhoneNumber()async{

_auth.verifyPhoneNumber(phoneNumber: phone,
    verificationCompleted: (phoneAuthCredential) async{

     print("ppp"+phoneAuthCredential.toString());
    },
    verificationFailed: (verificationFailed)async{
      print("ppp"+verificationFailed.toString());
    },
    codeSent:(verficationId,resendingToken)async{
      this.verificationId=verficationId;
      update();
      print("sss="+verficationId);
    },
    codeAutoRetrievalTimeout: (verificationId)async{});

   Get.to(VerifyOtp());
  }


  Future sendCodeToFireBase(String code)async{

       if(this.verificationId!=null){
         var credential=PhoneAuthProvider.credential(
             verificationId: verificationId, smsCode: code);

         await _auth.signInWithCredential(credential).then((value){

           Get.to(ControlView());
         }).whenComplete(() {

         })
             .onError((error, stackTrace) {

                 print("error");
         });
       }
  }


   void ResetPassword()async{
    _auth.sendPasswordResetEmail(email: email);

    Get.to(ControlView());
   Get.snackbar('تم', 'ارسلنا لك رابط علي الايميل تستطيع اعادة كلمة المرور من خلاله',backgroundColor: Colors.lightGreen,colorText:Colors.white,
   duration:Duration(seconds:10)
   );
   }

  Future<void> saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      user.user.uid,
      user.user.email,
      name == null ? user.user.displayName : name,
      " ",
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
