import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/buttons.dart';
import 'package:twitter_copycat/theme/theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: LightTheme.theme, // Utilizando el tema de luz definido en tu aplicación
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Evitando el botón de retroceso predeterminado
          title: const HomeTwitterHeader(), // Utilizando el encabezado personalizado de Twitter
        ),
        body: Stack(
          children: [
            const Center(
              child: Text('Home Screen Content Here'), // Contenido de la pantalla de inicio aquí
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FeatherButton(), // Colocando el botón de la pluma en la esquina inferior derecha
            ),
          ],
        ),
        bottomNavigationBar: const HomeNavBar(), // Utilizando la barra de navegación inferior personalizada
      ),
    );
  }
}