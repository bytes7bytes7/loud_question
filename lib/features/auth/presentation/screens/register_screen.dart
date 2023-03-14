import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

import '../../../common/presentation/widgets/widgets.dart';
import '../../application/blocs/register/register_bloc.dart';

const _paddingH = 20.0;
const _paddingV = 14.0;
final _getIt = GetIt.instance;

class RegisterScreen extends HookWidget {
  const RegisterScreen({super.key});

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
        create: (context) => _getIt.get<RegisterBloc>(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Регистрация',
              style: theme.textTheme.headlineMedium,
            ),
            const Spacer(),
            _LoginField(
              controller: loginController,
            ),
            _PasswordField(
              controller: passwordController,
            ),
            const _ToLogInButton(),
            const Spacer(),
            _RegisterButton(
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

class _LoginField extends StatelessWidget {
  const _LoginField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Логин',
            enabled: !state.isLoading,
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
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Пароль',
            enabled: !state.isLoading,
          ),
        );
      },
    );
  }
}

class _ToLogInButton extends StatelessWidget {
  const _ToLogInButton();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterBloc>();

    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextButton(
          onPressed: state.isLoading
              ? null
              : () => bloc.add(const OpenLogInRegisterEvent()),
          child: const Text('Уже есть аккаунт?'),
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    required this.loginController,
    required this.passwordController,
  });

  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterBloc>();

    return BlocConsumer<RegisterBloc, RegisterState>(
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
                    DoRegisterEvent(
                      name: loginController.text,
                      password: passwordController.text,
                    ),
                  ),
          child: const Text('Зарегистрироваться'),
        );
      },
    );
  }
}
