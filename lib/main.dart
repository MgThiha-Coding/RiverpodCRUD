import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_crud/screen/home.dart';

void main()=> runApp( 
  ProviderScope(child: RiverCrud())
);

class RiverCrud extends StatelessWidget {
  const RiverCrud({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
       debugShowCheckedModeBanner: false,
       home: Home(),
    );
  }
}