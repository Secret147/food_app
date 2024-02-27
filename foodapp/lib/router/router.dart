import 'package:flutter/material.dart';
import 'package:foodapp/models/bill.dart';
import 'package:foodapp/models/dish.dart';

import 'package:foodapp/models/userInfor.dart';
import 'package:foodapp/pages/cart/cart_page.dart';
import 'package:foodapp/pages/detail/detail_page.dart';
import 'package:foodapp/pages/edit/edit_profile_page.dart';
import 'package:foodapp/pages/forgotpassword/forgotpassword.dart';
import 'package:foodapp/pages/home/home_page.dart';
import 'package:foodapp/pages/introduction/introduction_page.dart';
import 'package:foodapp/pages/listreview/list_review_page.dart';
import 'package:foodapp/pages/order/order_page.dart';
import 'package:foodapp/pages/otp/otp_page.dart';
import 'package:foodapp/pages/payment/payment_page.dart';
import 'package:foodapp/pages/profile/profile_page.dart';
import 'package:foodapp/pages/review/review_page.dart';
import 'package:foodapp/pages/search/search_page.dart';
import 'package:foodapp/pages/signin/signin_page.dart';
import 'package:foodapp/pages/signup/signup_page.dart';
import 'package:foodapp/pages/type/type_page.dart';
import 'package:go_router/go_router.dart';

class RouterCustom {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          name: "home",
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'search',
              name: "search",
              builder: (BuildContext context, GoRouterState state) {
                List<Dish> listItem = state.extra as List<Dish>;
                return SearchPage(
                  listItem: listItem,
                );
              },
              pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage<void>(
                  key: state.pageKey,
                  child: SearchPage(listItem: state.extra as List<Dish>),
                  transitionDuration: const Duration(milliseconds: 400),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    // Change the opacity of the screen using a Curve based on the the animation's
                    // value
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                );
              },
            ),
          ]),
      GoRoute(
        path: '/introduction',
        name: "introduction",
        builder: (BuildContext context, GoRouterState state) {
          return const IntroductionPage();
        },
      ),
      GoRoute(
        path: '/signup',
        name: "signup",
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpPage();
        },
      ),
      GoRoute(
        path: '/signin',
        name: "signin",
        builder: (BuildContext context, GoRouterState state) {
          return const SignInPage();
        },
      ),
      GoRoute(
        path: '/detail',
        name: "detail",
        builder: (BuildContext context, GoRouterState state) {
          Dish item = state.extra as Dish;
          return DetailPage(
            item: item,
          );
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: DetailPage(item: state.extra as Dish),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/cart',
        name: "cart",
        builder: (BuildContext context, GoRouterState state) {
          return const CartPage();
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const CartPage(),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
          path: '/profile',
          name: "profile",
          builder: (BuildContext context, GoRouterState state) {
            return const ProfilePage();
          },
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child: const ProfilePage(),
              transitionDuration: const Duration(milliseconds: 400),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                // Change the opacity of the screen using a Curve based on the the animation's
                // value
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'editprofile',
              name: "editprofile",
              builder: (BuildContext context, GoRouterState state) {
                UserInfor user = state.extra as UserInfor;
                return EditProfilePage(
                  user: user,
                );
              },
              pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage<void>(
                  key: state.pageKey,
                  child: EditProfilePage(
                    user: state.extra as UserInfor,
                  ),
                  transitionDuration: const Duration(milliseconds: 400),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    // Change the opacity of the screen using a Curve based on the the animation's
                    // value
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                );
              },
            ),
          ]),
      GoRoute(
        path: '/otp',
        name: "otp",
        builder: (BuildContext context, GoRouterState state) {
          dynamic otp = state.extra as dynamic;
          return OTPPage(
            otp: otp,
          );
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: OTPPage(otp: state.extra as dynamic),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/forgotpassword',
        name: "forgotpassword",
        builder: (BuildContext context, GoRouterState state) {
          return const ForgotPassword();
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const ForgotPassword(),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/type',
        name: "type",
        builder: (BuildContext context, GoRouterState state) {
          dynamic type = state.extra as String;
          return TypePage(
            type: type,
          );
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: TypePage(
              type: state.extra as dynamic,
            ),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/review',
        name: "review",
        builder: (BuildContext context, GoRouterState state) {
          Dish dish = state.extra as Dish;
          return ReviewPage(dish: dish);
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: ReviewPage(dish: state.extra as Dish),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/listreview',
        name: "listreview",
        builder: (BuildContext context, GoRouterState state) {
          Dish dish = state.extra as Dish;
          return ListReviewPage(dish: dish);
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: ListReviewPage(dish: state.extra as Dish),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/payment',
        name: "payment",
        builder: (BuildContext context, GoRouterState state) {
          Bill bill = state.extra as Bill;
          return PaymentPage(bill: bill);
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: PaymentPage(bill: state.extra as Bill),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/order',
        name: "order",
        builder: (BuildContext context, GoRouterState state) {
          Dish dish = state.extra as Dish;
          return const OrderPage();
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const OrderPage(),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
