import 'package:flutter/material.dart';

class Login2Screen extends StatefulWidget {
  const Login2Screen({super.key});

  @override
  State<Login2Screen> createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool tampilPassword = true;
  bool isDarkMode = false; // Variabel untuk mode gelap atau terang

  showPassword() {
    setState(() {
      tampilPassword = !tampilPassword;
    });
  }

  // Mengubah tema mode gelap atau terang
  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Tema terang default
      darkTheme: ThemeData.dark(), // Tema gelap
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Memilih mode
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(),
              ),
              TextField(
                obscureText: tampilPassword,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "password",
                  hintText: "masukan password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      showPassword();
                    },
                    icon: Icon(
                      tampilPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Aksi login bisa ditambahkan di sini
                },
                child: Text("Login"),
              ),
              // Tombol untuk toggle antara Dark Mode dan Light Mode
              IconButton(
                icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                onPressed: toggleDarkMode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
