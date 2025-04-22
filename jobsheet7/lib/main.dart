import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halaman NestedScrollView',
      home: const NestedScrollExample(),
    );
  }
}

class NestedScrollExample extends StatelessWidget {
  const NestedScrollExample({super.key});

  // Dummy data hotel
  final List<Map<String, String>> hotels = const [
    {
      'name': 'Hotel Santai Indah',
      'location': 'Bali, Indonesia',
      'price': 'Rp 850.000 / malam',
      'image':
          'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aG90ZWx8ZW58MHx8MHx8fDA%3D',
    },
    {
      'name': 'The Grand Comfort',
      'location': 'Jakarta, Indonesia',
      'price': 'Rp 1.200.000 / malam',
      'image':
          'https://plus.unsplash.com/premium_photo-1661964402307-02267d1423f5?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aG90ZWwlMjByb29tfGVufDB8fDB8fHww',
    },
    {
      'name': 'Seaside Resort',
      'location': 'Lombok, Indonesia',
      'price': 'Rp 950.000 / malam',
      'image':
          'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aG90ZWwlMjByb29tfGVufDB8fDB8fHww',
    },
    {
      'name': 'Mountain View Inn',
      'location': 'Bandung, Indonesia',
      'price': 'Rp 700.000 / malam',
      'image':
          'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG90ZWwlMjByb29tfGVufDB8fDB8fHww',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.black.withOpacity(0.7),
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Rekomendasi Hotel',
                  style: TextStyle(
                    color: Colors.white, // <- Ubah warna teks di sini
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Image.network(
                  'https://images.unsplash.com/photo-1517840901100-8179e982acb7?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            final hotel = hotels[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    hotel['image']!,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  hotel['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${hotel['location']}\n${hotel['price']}'),
                isThreeLine: true,
                trailing: const Icon(Icons.hotel),
              ),
            );
          },
        ),
      ),
    );
  }
}
