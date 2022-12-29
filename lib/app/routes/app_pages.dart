import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/CartPage/views/cart_page_view.dart';

import '../modules/AboutPage/bindings/about_page_binding.dart';
import '../modules/AboutPage/views/about_page_view.dart';
import '../modules/EditProfilePage/bindings/edit_profile_page_binding.dart';
import '../modules/EditProfilePage/views/edit_profile_page_view.dart';
import '../modules/ForgotPasswordPage/bindings/forgot_password_page_binding.dart';
import '../modules/ForgotPasswordPage/views/forgot_password_page_view.dart';
import '../modules/LoginPage/bindings/login_page_binding.dart';
import '../modules/LoginPage/views/login_page_view.dart';
import '../modules/ProfilePage/bindings/setting_page_binding.dart';
import '../modules/ProfilePage/views/profile_page_view.dart';
import '../modules/RatePage/bindings/rate_page_binding.dart';
import '../modules/RatePage/bindings/rate_page_binding.dart';
import '../modules/RatePage/views/rate_page_view.dart';
import '../modules/RatePage/views/rate_page_view.dart';
import '../modules/RegisterPage/bindings/register_page_binding.dart';
import '../modules/RegisterPage/views/register_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPage(),
      // binding: LoginPage(),
    ),
    GetPage(
      name: _Paths.RATE_PAGE,
      page: () => RatePage(),
      // binding: RatePageBinding(),
      children: [
        GetPage(name: _Paths.RATE_PAGE, page: () => RatePage()),
        // binding: RatePageBinding(),
        // ),
      ],
    ),
    GetPage(
      name: _Paths.SETTING_PAGE,
      page: () => ProfilePage(),
      // binding: SettingPageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_PAGE,
      page: () => RegisterPage(),
      // binding: RegisterPageBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_PAGE,
      page: () => ForgotPasswordPage(),
      // binding: ForgotPasswordPageBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_PAGE,
      page: () => AboutPage(),
      // binding: AboutPAgeBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_PAGE,
      page: () => EditProfilePage(),
      // binding: EditProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_PAGE,
      page: () => CartPage(),
      // binding: EditProfilePageBinding(),
    ),
  ];
}
