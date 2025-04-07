import 'package:flutter/material.dart';

class {{feature_name.pascalCase()}}Text extends StatelessWidget {
  const {{feature_name.pascalCase()}}Text({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('{{feature_name.camelCase()}}Text');
  }
}
