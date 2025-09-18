import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categorias = [];

  @override
  void initState() {
    super.initState();
    cargar();
  }

  Future<void> cargar() async {
    final data = await ApiService.getCategorias();
    setState(() {
      categorias = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categorías")),
      body: ListView.builder(
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(categorias[index]["nombre"]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ApiService.addCategoria("Nueva Categoría");
          cargar();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
