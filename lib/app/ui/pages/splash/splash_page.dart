import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import 'controller/splash_controller.dart';

final splashProvider = SimpleProvider(
  (ref) => SplashController(),
);

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider,
      onChange: (context, controller) {
        if (controller.navigate) {
          Navigator.of(context).pushReplacementNamed(controller.routeName);
        }
      },
      builder: (_, __) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/splash.jpg",
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                    Center(
                      child: Consumer(
                        builder: (_, ref, __) {
                          final navigate = ref
                              .watch(
                                splashProvider.select(
                                  (_) => _.navigate,
                                ),
                              )
                              .navigate;
                          return !navigate
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: CircularProgressIndicator(),
                                )
                              : Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
