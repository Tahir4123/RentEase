import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentease/landowner/home/components/dueGraph.dart';
import 'package:rentease/landowner/home/components/maintenanceGraph.dart';
import 'package:rentease/landowner/home/components/rentGraph.dart';

class admin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: ()=>Navigator.pop(context),
              icon: Icon(Icons.arrow_back_rounded),
            ),
          ),
          body: SingleChildScrollView(
            child: (
                Column(
                  children: [
                    due_graph(),
                    rating(),
                    rentGraph(),
                  ],
                )
            ),
          ),
        )
    );
  }

}