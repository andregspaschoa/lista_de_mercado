import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lista_de_mercado/widgets/grocery_list.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Firebase antes de rodar o app
  await Firebase.initializeApp();

  // Autenticação anônima
  await signInAnonymously();

  runApp(const MyApp());
}

// Função para autenticar anonimamente no Firebase
Future<void> signInAnonymously() async {
  try {
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    debugPrint('Autenticação anônima bem-sucedida: ${userCredential.user?.uid}');
  } catch (e) {
    debugPrint('Erro ao autenticar anonimamente: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        // ignore: deprecated_member_use
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 112, 226, 255),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 42, 51, 59),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
      ),
      home: const GroceryList(),
    );
  }
}
