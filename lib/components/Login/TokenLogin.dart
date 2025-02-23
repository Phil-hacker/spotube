import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:platform_ui/platform_ui.dart';
import 'package:spotube/components/Login/TokenLoginForms.dart';
import 'package:spotube/components/Shared/PageWindowTitleBar.dart';
import 'package:spotube/hooks/useBreakpoints.dart';

class TokenLogin extends HookConsumerWidget {
  const TokenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final breakpoint = useBreakpoints();
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: PlatformScaffold(
        appBar: PageWindowTitleBar(leading: const PlatformBackButton()),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: PlatformTheme.of(context).secondaryBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/spotube-logo.png",
                    width: MediaQuery.of(context).size.width *
                        (breakpoint <= Breakpoints.md ? .5 : .3),
                  ),
                  PlatformText("Add your spotify credentials to get started",
                      style: breakpoint <= Breakpoints.md
                          ? textTheme.headline5
                          : textTheme.headline4),
                  PlatformText(
                    "Don't worry, any of your credentials won't be collected or shared with anyone",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(height: 10),
                  TokenLoginForm(
                    onDone: () => GoRouter.of(context).go("/"),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const PlatformText("Don't know how to do this?"),
                      PlatformTextButton(
                        child: const PlatformText(
                          "Follow along the Step by Step guide",
                        ),
                        onPressed: () => GoRouter.of(context).push(
                          "/login-tutorial",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
