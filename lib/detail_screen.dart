import 'package:first_chapter_flutter/model/TourismPlace.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace passedPlace;

  const DetailScreen({required this.passedPlace});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(passedPlace.imageAsset),
              Container(
                child: Text(
                  passedPlace.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.only(top: 16.0),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0),
                      Text(passedPlace.openDays)
                    ]),
                    Column(children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(height: 8.0),
                      Text(passedPlace.openTime)
                    ]),
                    Column(
                      children: <Widget>[
                        Icon(Icons.paid),
                        SizedBox(height: 8.0),
                        Text(passedPlace.ticketPrice)
                      ],
                    )
                  ],
                ),
                margin: EdgeInsets.only(top: 16.0),
              ),
              Container(
                child: Text(
                  passedPlace.description,
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(16.0),
              ),
              Container(
                height: 150,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: passedPlace.imageUrls.map((url) {
                      return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(url)));
                    }).toList()

                    // [
                    //   Padding(
                    //       padding: const EdgeInsets.all(4.0),
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: Image.network(
                    //             'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                    //       )),
                    //   Padding(
                    //       padding: const EdgeInsets.all(4.0),
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: Image.network(
                    //             'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'),
                    //       )),
                    //   Padding(
                    //       padding: const EdgeInsets.all(4.0),
                    //       child: ClipRRect(
                    //           borderRadius: BorderRadius.circular(10),
                    //           child: Image.network(
                    //               'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg')))
                    // ],
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
