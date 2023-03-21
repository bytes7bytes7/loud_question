import 'package:flutter/material.dart';

import '../../application/view_models/user_vm/user_vm.dart';

const _iconRightPadding = 5.0;

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
    this.onPressed,
  });

  final UserVM user;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusIconColor = theme.colorScheme.primary;

    return ListTile(
      onTap: onPressed,
      title: Row(
        children: [
          if (user.isCreator)
            Padding(
              padding: const EdgeInsets.only(
                right: _iconRightPadding,
              ),
              child: Icon(
                Icons.star,
                color: statusIconColor,
              ),
            ),
          if (user.isLeader)
            Padding(
              padding: const EdgeInsets.only(
                right: _iconRightPadding,
              ),
              child: Icon(
                Icons.record_voice_over,
                color: statusIconColor,
              ),
            ),
          Text(
            user.name,
            style: theme.textTheme.titleLarge,
          ),
        ],
      ),
      subtitle: Text(user.id),
      trailing: _TrailingIcon(
        state: user.state,
        theme: theme,
      ),
    );
  }
}

class _TrailingIcon extends StatelessWidget {
  const _TrailingIcon({
    required this.state,
    required this.theme,
  });

  final UserState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final color = theme.colorScheme.onSurface;

    if (state == UserState.notReady) {
      return Icon(
        Icons.timelapse,
        color: color,
      );
    }

    if (state == UserState.ready) {
      return Icon(
        Icons.done,
        color: color,
      );
    }

    if (state == UserState.answering) {
      return Icon(
        Icons.timelapse,
        color: color,
      );
    }

    if (state == UserState.answered) {
      return Icon(
        Icons.done,
        color: color,
      );
    }

    if (state == UserState.rightAnswer) {
      return Icon(
        Icons.done_all,
        color: theme.colorScheme.primary,
      );
    }

    if (state == UserState.wrongAnswer) {
      return Icon(
        Icons.error_outline,
        color: theme.colorScheme.error,
      );
    }

    return const SizedBox.shrink();
  }
}
