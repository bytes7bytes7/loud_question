import 'package:flutter/material.dart';

class LobbyCard extends StatelessWidget {
  const LobbyCard({
    super.key,
    required this.lobbyID,
    required this.creatorName,
    required this.onPressed,
  });

  final String lobbyID;
  final String creatorName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(lobbyID),
        subtitle: Row(
          children: [
            Text(
              'Создатель:',
              style: theme.textTheme.labelLarge,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(creatorName),
          ],
        ),
      ),
    );
  }
}
