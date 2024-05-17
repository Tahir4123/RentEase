import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rentease/constants.dart';
import 'package:rentease/size_config.dart';



import '../../../model/House.dart';

class map extends StatefulWidget {
  map({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;


  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15,top: 15,right: 30,bottom: 15),
              child: Container(
                width: 150,
                child: Text(
                  widget.property['address'],
                  maxLines: 5,
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: getProportionateScreenHeight(14),
                  ),
                ),
              ),
            ),
            Container(
              height: SizeConfig.screenHeight * 0.15,
              width: SizeConfig.screenWidth * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(19.0607, 72.8361),
                    zoom: 18,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


