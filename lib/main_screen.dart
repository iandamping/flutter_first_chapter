import 'package:first_chapter_flutter/detail_screen.dart';
import 'package:first_chapter_flutter/model/TourismPlace.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wisata Bandung"),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) {
              final TourismPlace place = tourismPlaceList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(passedPlace: place,);
                  }));
                },
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(place.imageAsset),
                        flex: 1,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                place.name,
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(place.location),
                            ],
                          ),
                        ),
                        flex: 2,
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: tourismPlaceList.length));
  }
}
