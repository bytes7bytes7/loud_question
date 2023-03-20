import 'package:flutter/material.dart';

import '../../application/view_models/user_vm/user_vm.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final UserVM user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  if (user.role == UserRole.admin) const Icon(Icons.star),
                  if (user.role == UserRole.leader)
                    const Icon(Icons.record_voice_over),
                  Text(user.name),
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
