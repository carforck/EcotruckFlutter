import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;
  final VoidCallback onEdit;

  const CustomProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.imagePath,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: 120,
            height: 120,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          role,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: onEdit,
          icon: const Icon(Icons.edit),
          label: const Text('Editar perfil'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
