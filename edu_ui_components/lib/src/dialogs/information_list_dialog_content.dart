import 'package:flutter/material.dart';

class InformationListDialogContent extends StatelessWidget {
  final List<String> items;

  const InformationListDialogContent({ required this.items, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var i = 0; i < items.length; i++)
        Padding(
          padding: i == 0 ? EdgeInsets.zero : const EdgeInsets.only(top: 8),
          child: Text('${i + 1}) ${items[i]}'),
        ),
    ],
  );
}