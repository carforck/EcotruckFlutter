import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const LoginPage({super.key, required this.onToggleTheme});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxFormWidth = screenWidth > 600 ? 400.0 : screenWidth * 0.9;

    return Scaffold(
      body: Stack(
        children: [
          // Fondo
          SizedBox.expand(
            child: Image.asset(
              'assets/fondo_ecotruck.png',
              fit: BoxFit.cover,
            ),
          ),

          // Filtro oscuro
          Container(
            color: const Color.fromRGBO(0, 0, 0, 0.5),
          ),

          // 🔘 Botón de tema (solo ícono, arriba a la derecha)
Positioned(
  top: 32,
  right: 16,
  child: IconButton(
    onPressed: widget.onToggleTheme,
    icon: Icon(
      Theme.of(context).brightness == Brightness.dark
          ? Icons.light_mode
          : Icons.dark_mode,
      size: 28,
    ),
    style: IconButton.styleFrom(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white.withValues(alpha: 0.1)
        : Colors.black.withValues(alpha: 0.1),
      padding: const EdgeInsets.all(12),
    ),
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black,
  ),
),


          // Contenido
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Logo en círculo
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha:0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo_ecotruck.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  const Text(
                    'Bienvenido',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Formulario
                  SizedBox(
                    width: maxFormWidth,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Correo electrónico',
                                prefixIcon: Icon(Icons.email_outlined),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                labelText: 'Contraseña',
                                prefixIcon: const Icon(Icons.lock_outline),
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/home');
                                },
                                child: const Text('Ingresar'),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
    Expanded(child: Text('¿Olvidaste tu contraseña?')),
    Expanded(child: Text('Registrarse', textAlign: TextAlign.end)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
