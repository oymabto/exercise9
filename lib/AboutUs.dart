import 'package:flutter/material.dart';

import 'DisplayUserGrid.dart';
import 'MainLayout.dart';

// The AboutUs class represents a stateless widget, which means it does not have any mutable state.
// The class has a constructor that takes a Key object as an optional parameter.
class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
        title: "About Us",
        child: Text("Hi, welcome to Excise 9 - About Us page designed by Alireza.")
    );
  }
}
