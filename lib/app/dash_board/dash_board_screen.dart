
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashBoardScreen extends ConsumerWidget{
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return const Scaffold(
      body: Column(
        children: [
          Text("DashBoard Screen"),
        ],
      ),
    );
  }
}