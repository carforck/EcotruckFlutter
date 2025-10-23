import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // Importa tu nueva vista

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(), // Usa tu vista de login aquí
    );
  }
}
