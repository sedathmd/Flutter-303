import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/extension/string_extension.dart';
import '../viewModel/reqres_view_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({super.key});

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

class _ReqresViewState extends ReqresViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: isLoading ? const CircularProgressIndicator() : null),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              color: Color(resources[index].color?.colorValue ?? 0),
              child: Text(resources[index].name ?? ''));
          //direk resources döndürseydik
          //Text(resources[index].data.name);
        },
      ),
    );
  }
}
