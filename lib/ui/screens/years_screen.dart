import 'package:flutter/material.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';
import 'package:project_stud/ui/widgets/welcome_widgite.dart';

class YearsScreen extends StatelessWidget {
  YearsScreen({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const WelcomeWidget(text: 'Reaam'),
          CustomTextFieldSearch(
            controller: _searchController,
            text: '',
            hintText: '',
            prefixIcon: Icons.search,
          ),
          const Padding(padding: EdgeInsets.all(20)),
          Column(
            children: List.generate(10, (index) {
              return ListTile(
                leading:const Icon(Icons.book),
                title: Text('Subject ${index + 1}'),
                subtitle: Text('Details about Subject ${index + 1}'),
              );
            }),
          )
        ],
      ),
    ));
  }
}
