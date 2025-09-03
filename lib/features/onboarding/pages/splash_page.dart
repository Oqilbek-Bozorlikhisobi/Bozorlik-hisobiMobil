import 'package:bozorlik/common/values/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/repositories/auth_repository.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 1)).then((_) {
        authRepository.initialRoute(ref).then((route) {
          if (context.mounted) {
            context.go(route);
          }
        });
      });

      return null;
    }, [0]);
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.logo, height: 200, width: 200),
      ),
    );
  }
}
