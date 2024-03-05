import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/responsive/responsive.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
          desktop: showMessage('Desktop'), 
          mobile: showMessage('Mobile'), 
          tablet: showMessage('Tablet')),
    );
  }
  
  Widget showMessage(String name){
    return Center(child: Text(name));
  }
}
