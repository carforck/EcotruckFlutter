import 'package:flutter/material.dart';
import '../widgets/responsive_map.dart';
import '../widgets/zone_indicator.dart';
import '../widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const HomePage({super.key, required this.onToggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        onLogout: () {
          Navigator.pushReplacementNamed(context, '/');
        },
      ),
      body: Stack(
        children: [
          const ResponsiveMap(),

          // 🌙 Botón de cambio de tema (solo ícono)
          Positioned(
            top: 32,
            right: 16,
            child: IconButton(
              onPressed: widget.onToggleTheme,
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                size: 28,
              ),
              style: IconButton.styleFrom(
                backgroundColor: isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.1),
                padding: const EdgeInsets.all(12),
              ),
              color: isDark ? Colors.white : Colors.black,
            ),
          ),

          // 🍔 Botón de menú (hamburguesa)
          Positioned(
            top: 32,
            left: 16,
            child: IconButton(
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: const Icon(Icons.menu),
              style: IconButton.styleFrom(
                backgroundColor: isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.1),
                padding: const EdgeInsets.all(12),
              ),
              color: isDark ? Colors.white : Colors.black,
            ),
          ),

          // 🟢 Indicador de zona centrado arriba
          Positioned(
            top: 32,
            left: 0,
            right: 0,
            child: const Center(
              child: ZoneIndicator(zoneText: "0 | 12"),
            ),
          ),

          // 📍 Widgets inferiores
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Estás desconectado',
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Lógica de conexión
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text('Conectar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
