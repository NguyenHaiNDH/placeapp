import 'package:flutter/material.dart';
import '../models/place.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Place>> places;

  @override
  void initState() {
    super.initState();
    places = ApiService.getAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Destinations')),
      body: FutureBuilder<List<Place>>(
        future: places,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data!
                  .map((place) => Card(
                child: Column(
                  children: [
                    Image.network(place.imageUrl, width: 150, height: 100, fit: BoxFit.cover),
                    Text(place.name),
                    Text('⭐ ${place.rating}'),
                  ],
                ),
              ))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
