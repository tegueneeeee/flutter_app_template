import 'package:features_force_update/src/ui/components/force_update_text.dart';
import 'package:features_force_update/src/ui/pages/list/components/force_update_list_text.dart';
import 'package:flutter/material.dart';

class ForceUpdateListPage extends StatelessWidget {
  const ForceUpdateListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('forceUpdateListAppBarTitle'),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ForceUpdateText(),
              ForceUpdateListText(),
            ],
          ),
        ),
      ),
    );
  }
}
