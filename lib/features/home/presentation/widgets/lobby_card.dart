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
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListTile(
          title: Text(lobbyID),
          subtitle: Text(creatorName),
        ),
      ),
    );
  }
}
