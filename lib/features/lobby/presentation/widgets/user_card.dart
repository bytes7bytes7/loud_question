import 'package:flutter/material.dart';

import '../../application/view_models/user_vm/user_vm.dart';

const _iconRightPadding = 5.0;

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final UserVM user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (user.isCreator)
                    const Padding(
                      padding: EdgeInsets.only(
                        right: _iconRightPadding,
                      ),
                      child: Icon(Icons.star),
                    ),
                  if (user.isLeader)
                    const Padding(
                      padding: EdgeInsets.only(
                        right: _iconRightPadding,
                      ),
                      child: Icon(Icons.record_voice_over),
                    ),
                  Text(
                    user.name,
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
              Text(user.id),
            ],
          ),
          if (user.state == UserState.notReady) const Icon(Icons.timelapse),
          if (user.state == UserState.ready) const Icon(Icons.done),
          if (user.state == UserState.answering) const Icon(Icons.edit_note),
          if (user.state == UserState.answered) const Icon(Icons.done_all),
          if (user.state == UserState.rightAnswer) const Icon(Icons.done_all),
          if (user.state == UserState.wrongAnswer)
            const Icon(Icons.error_outline),
        ],
      ),
    );
  }
}
