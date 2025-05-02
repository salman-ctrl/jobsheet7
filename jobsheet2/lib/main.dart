import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(title: const Text('App - Salman')),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Original Welcome Text
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Welcome to My App',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 3,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),

              // Icon Widget Section
              const Text(
                'Icon Widget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Single Star Icon (from instructions)
              const Icon(Icons.star, size: 50, color: Colors.amber),
              const SizedBox(height: 20),
              // Task: 5 different icons in a row
              const Text(
                '5 Different Icons:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite, size: 40, color: Colors.red),
                  SizedBox(width: 10),
                  Icon(Icons.home, size: 40, color: Colors.blue),
                  SizedBox(width: 10),
                  Icon(Icons.email, size: 40, color: Colors.green),
                  SizedBox(width: 10),
                  Icon(Icons.phone, size: 40, color: Colors.purple),
                  SizedBox(width: 10),
                  Icon(Icons.music_note, size: 40, color: Colors.orange),
                ],
              ),
              const SizedBox(height: 30),

              // Image Widget Section
              const Text(
                'Image Widget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Task: 2 images (1 local, 1 from URL)
              Column(
                children: [
                  const Text(
                    'Local Image:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // Note: You need to add the image to your assets folder and update pubspec.yaml
                  // Image.asset('assets/ade.png', width: 200),
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text('Local Image\n(Add to assets folder)'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Network Image:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.network(
                    'https://picsum.photos/200/300',
                    width: 200,
                    height: 200,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value:
                              loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Text('Error loading image'));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Input Widget Section
              const Text(
                'Input Widget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your text',
                    hintText: 'Type something here',
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
