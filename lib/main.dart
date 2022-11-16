import 'package:ecommerce/app/pages/auth/sign_in_page.dart';
import 'package:ecommerce/app/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'app/auth_widget.dart';
import 'app/pages/admin/admin_home.dart';
import 'app/pages/user/user_home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey =
      "pk_test_51M4oUWDIREDkpnK6CXXP5sgBjpNd987nDQvXmrdAFY8SmTtKVgkvUClXSIxZWa4969eUsX5siy8S6WaWeXldE7hW00pXwlDu66";
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange, primary: Colors.orange),
      ),
      home: AuthWidget(
        adminSignedInBuilder: (context) => const AdminHome(),
        signedInBuilder: (context) => const UserHome(),
        nonSignedInBuilder: (_) => const SignInPage(),
      ),
    );
  }
}
