import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/screens/add_place.dart';
import 'package:favourite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});
  
  @override
  ConsumerState<PlacesScreen> createState() {
    return _PlaceScreenState();
  }

}

class _PlaceScreenState extends ConsumerState<PlacesScreen>{
  late Future<void> _placesFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _placesFuture=ref.read(userPlaceProvider.notifier).loadPlaces();
  }
  @override
  Widget build(BuildContext context,) {
    final userPlaces=ref.watch(userPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const AddPlace()));
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Padding(padding:const EdgeInsets.all(8.0),child: FutureBuilder(future: _placesFuture, builder: (context,snapshot)=>snapshot.connectionState==ConnectionState.waiting? const Center(child: CircularProgressIndicator()):PlacesList(places: userPlaces,),)),
    );
  }
}
