import 'package:app/data_layer/Category.dart';
import 'package:app/screens/technicians-screen.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  CategoryTile({this.category});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, Technicians.id);
      },
      leading: CircleAvatar(
        child: Text(category.id.toString()),
      ),
      title: Text(category.name),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
