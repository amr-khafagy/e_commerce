import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          //onboarding
          "1": "اختر اللغة",
          "2": "اختر المنتجة",
          "3": "نحن لدينا 100 الف منتج  , اختر \n  منتجك  من  متجرنا",
          "4": "سهل وامن للشراء",
          "5": "يمكنك الدفع كاش او من خلال بوابات الدفع الالكترونية",
          "6": "تتبع طلبك",
          "7": "يمكنك تتبع طلبك في كل مرحلة وايضا التتبع من خلال الخريطة",
          "8": "متابعه",
          //auth
          "9": "تسجيل الدخول",
          "10": "اهلا بك",
          "11":
              "يمكنك تسجيل الدخول من خلال البريد وكلمة المرور او من خلال وسائل التواصل الاجتماعي",
          "12": "ادخل البريد الالكتروني",
          "13": "ادخل كلمة المرور",
          "14": "هل نسيت كلمة المرور",
          "15": "تسجيل الدخول",
          "16": "ليس لديك حساب ? ",
          "17": "انشاء حساب",
          "18": "البريد الالكتروني",
          "19": "كلمة المرور",
          "20": "اسم المستخدم",
          "21": "رقم الهاتف",
          "22": "ادخل رقم الهاتف",
          "23": "ادخل اسم المستخدم",
          "24":
              "انشاء حساب من خلال البريد وكلمة المرور او من خلال وسائل التواصل الاجتماعي",
          "25": " لديك حساب ? ",
          "26": "تسجيل الدخول",
          "27": "افحص البريد الالكتروني",
          "28": "تم تسجيل الدحول بنجاح",
          "29": "من فضلك ادخل عنوان البريد الالكتروني لاستلام رمز التحفف",
          "30": "تحقق",
          "31": "الذهاب الي تسجيل الدخول",
          "32": "تم بنجاح",
          "33": "حفط",
          "34": "من فضلك ادخل كلمة السر الجديدة",
          "35": "كلمة السر الجديدة",
          "36": "تم اعادة تعيين كلمة السر ",
          "37": "مبروك",
          "38": "التحقق من الرمز",
          "39": "ادحل الرمز وانتظر",
          "40": "تم التسجيل بنجاح",
          //validation
          "41": "البريد الالكتروني غير صالح \nيجب ان يكون مثال@مثال.com",
          "42":
              " كلمة السر غير صالحة يجب ان تكون مكونة من \nاحرف صغيرة وكبيرة وارقام ورموز ",
          "43": "يجب الايكون الحقل فارغ",
          "44": "يجب ان لا تقل عن",
          "45": "يجب ان لا تزيد عن",
          "46": "رقم التليفون غير صالح",
          "47": "الاسم عير صالح ",
          "48": "خطا",
          "49": "الايميل غير موجود",
          "50": "كود التحقق غير صحيح",
          "51": "البريد الالكتروني او كلمة السر غير صحيحة",
          "52": "البريد الالكتورني او رقم التليفون مستخدمة بالفعل",
          "53": "الاقسام",
          "54": "اوجد المنتج",
          "55": "الاكثر مبيعا",
          //notification
          "56":"اشعار",
          "57":"تم اضافة المنتج الي المفضلة",
          "58":"تم حذف المنتج من المفضلة ",
          //bottomappbar
          "59":"الرئيسية",
          "60":"الاعدادات",
          "61": "عروض",
          "62": "الاشعارات",
          "63":"الذهاب الي عربة التسوق",
          "64":"الاضافة الي عربة التسوق",
          "65":"حذف من عربة التسوق",
          //Cart
          "66":"عربة التسوق",
          "67":"انت لديك",
          "68":"من العناصر في عربة التسوق",
          "69":"كود الخصم",
          "70":"تفعيل الكود",
          "71":"الكود الخاص بك",
          "72":"فعال",
          "73":"السعر",
          "74":"الخصم",
          "75":"التوصيل",
          "76":"الكلي",
          "77":"تحديد موقع الطلب"
        },
        "en": {
          "1": "Choose Language",
          "2": "Choose Product",
          "3":
              "We Have a 100k Product , Choose \n Your Product From  Our \n E-commerce Shop",
          "4": "Easy And Safe Paymnet",
          "5": "You can pay in cash \n or through payment gateways",
          "6": "Track Your Order",
          "7":
              "The order can be tracked at every stage \n until it reaches you",
          "8": "Continue",
          "9": "Sign In",
          "10": "Welcome Back",
          "11":
              "Sign In Your Email And Password Or  Continue With Social Media",
          "12": "Enter Your Email",
          "13": "Enter Your Password",
          "14": "Forget Password",
          "15": "Sign In",
          "16": "Dont Have An Account ? ",
          "17": "Sign Up",
          "18": "Email",
          "19": "Password",
          "20": "Username",
          "21": "Phone",
          "22": "Enter Your Phone",
          "23": "Enter Your Username",
          "24":
              "Sign Up With Your Email And Password OR Continue With Social Media",
          "25": " have an account ? ",
          "26": "SignIn",
          "27": "Check Email",
          "28": "Success SignUp",
          "29": "please Enter Your Email Address To Recive A verification code",
          "30": "check",
          "31": "Go To Login",
          "32": "Success",
          "33": "save",
          "34": "Please Enter new Password",
          "35": "New Password",
          "36": "Password has been reset successfully",
          "37": "congratulations",
          "38": "Verify Code",
          "39": "Enter Code To Verify",
          "40": "successfully registered",
          "41": "Not Valid Email \n Email Should Be example@example",
          "42":
              "Not Valid Password \nPassword Should be Contains letters,symbols,numbers",
          "43": "Can't Be Empty",
          "44": "Can't Be Less Than",
          "45": "Can't Be More Than",
          "46": "Not Valid PhoneNumber",
          "47": "Not Valid User Name",
          "48": "Error",
          "49": "Email not found",
          "50": "Your Verify Code is not correct",
          "51": "Email or Password is uncorrect",
          "52": "Email or Phone alredy used",
          "53": "Categories",
          "54": "Find A Product",
          "55": "Top Selling",
          "56":"Notification",
          "57":"items added to favourite",
          "58":"items removed from favourite",
          //bottomappbar
          "59":"Home",
          "60":"Setting",
          "61": "Offers",
          "62": "Notifications",
          //productDetails
          "63":"Go To Cart",
          "64":"Add To Cart",
          "65":"Delete From Cart",
          //Cart
          "66":"My Cart",
          "67":"You Have",
          "68":"Items In Yourt Cart",
          "69":"Coupon Code",
          "70":"Apply Coupon",
          "71":"Your code",
          "72":"has been activated",
          "73":"Price",
          "74":"discount",
          "75":"Shipping",
          "76":"Total",
          "77":"place order"
        }
      };
}
