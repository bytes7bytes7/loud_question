import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

import '../../../common/presentation/widgets/widgets.dart';
import '../../application/blocs/log_in/log_in_bloc.dart';

const _paddingH = 20.0;
const _paddingV = 14.0;
final _getIt = GetIt.instance;

class LogInScreen extends HookWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final viewPadding = mediaQuery.viewPadding;
    final availableHeight = size.height - viewPadding.top - viewPadding.bottom;

    final commonFocusNode = useFocusNode();
    final loginController = useTextEditingController();
    final passwordController = useTextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(commonFocusNode);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              height: availableHeight,
              child: _Body(
                loginController: loginController,
                passwordController: passwordController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.loginController,
    required this.passwordController,
  });

  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _paddingH,
        vertical: _paddingV,
      ),
      child: BlocProvider(
        create: (context) => _getIt.get<LogInBloc>(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Вход',
              style: theme.textTheme.headlineMedium,
            ),
            const Spacer(),
            _NameField(
              controller: loginController,
            ),
            _PasswordField(
              controller: passwordController,
            ),
            const _GoToRegisterButton(),
            const Spacer(),
            _LogInButton(
              loginController: loginController,
              passwordController: passwordController,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInBloc, LogInState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            enabled: !state.isLoading,
            labelText: 'Логин',
          ),
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInBloc, LogInState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            enabled: !state.isLoading,
            labelText: 'Пароль',
          ),
        );
      },
    );
  }
}

class _GoToRegisterButton extends StatelessWidget {
  const _GoToRegisterButton();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LogInBloc>();

    return BlocBuilder<LogInBloc, LogInState>(
      builder: (context, state) {
        return TextButton(
          onPressed: state.isLoading
              ? null
              : () => bloc.add(const OpenRegisterLogInEvent()),
          child: const Text('Нет аккаунта?'),
        );
      },
    );
  }
}

class _LogInButton extends StatelessWidget {
  const _LogInButton({
    required this.loginController,
    required this.passwordController,
  });

  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LogInBloc>();

    return BlocConsumer<LogInBloc, LogInState>(
      listener: (context, state) {
        if (state.error.isNotEmpty) {
          createSnackBar(
            context,
            message: state.error,
          );
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.isLoading
              ? null
              : () => bloc.add(
                    DoLogInEvent(
                      name: loginController.text,
                      password: passwordController.text,
                    ),
                  ),
          child: const Text('Войти'),
        );
      },
    );
  }
}
