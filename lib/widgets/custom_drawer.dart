import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onLogout;
  const CustomDrawer({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),

            // ✅ Imagen del perfil (sin zoom)
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/Perfil_Carlos.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain, // 🔥 muestra la cara completa
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Nombre y rol del usuario
            const Center(
              child: Column(
                children: [
                  Text(
                    'Carlos Carranza',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Ciudadano',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Divider(),

            // Menú de opciones
            Expanded(
              child: ListView(
                children: [
                  _buildDrawerItem(Icons.person, 'Perfil', context, route: '/edit-profile'),
                  _buildDrawerItem(Icons.notifications, 'Notificaciones', context),
                  _buildDrawerItem(Icons.calendar_today, 'Calendario', context),
                  _buildDrawerItem(Icons.settings, 'Configuración', context),
                ],
              ),
            ),

            const Divider(),

            // Botón de cerrar sesión
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: onLogout,
                icon: const Icon(Icons.logout),
                label: const Text('Cerrar sesión'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, BuildContext context, {String? route}) {
  return ListTile(
    leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
    title: Text(title),
    onTap: () {
      Navigator.pop(context);
      if (route != null) {
        Navigator.pushNamed(context, route);
      }
    },
  );
}
}