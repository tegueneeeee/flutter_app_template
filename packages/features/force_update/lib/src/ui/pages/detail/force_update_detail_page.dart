import 'package:features_force_update/src/ui/components/force_update_text.dart';
import 'package:features_force_update/src/ui/pages/detail/components/force_update_detail_text.dart';
import 'package:flutter/material.dart';

class ForceUpdateDetailPage extends StatelessWidget {
  const ForceUpdateDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('forceUpdateDetailAppBarTitle'),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ForceUpdateText(),
              ForceUpdateDetailText(),
            ],
          ),
        ),
      ),
    );
  }
}
