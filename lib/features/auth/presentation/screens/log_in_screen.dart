import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const _paddingH = 20.0;
const _paddingV = 14.0;

class LogInScreen extends HookWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final viewPadding = mediaQuery.viewPadding;
    final availableHeight = size.height - viewPadding.top - viewPadding.bottom;

    final commonFocusNode = useFocusNode();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(commonFocusNode);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              height: availableHeight,
              child: const _Body(),
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _paddingH,
        vertical: _paddingV,
      ),
      child: Column(
        children: [
          Text(
            'Вход',
            style: theme.textTheme.headlineMedium,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Логин',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Пароль',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Войти'),
          ),
        ],
      ),
    );
  }
}
