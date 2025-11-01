import 'package:flutter/material.dart';

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  final textController = TextEditingController();
  
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Widget _buildListCreator() => const SizedBox();
  Widget _buildMasterPlans() => const SizedBox();
}
