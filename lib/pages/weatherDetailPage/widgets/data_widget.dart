import 'package:etiya_assignment/core/shared/constant/app_ui_constant.dart';
import 'package:etiya_assignment/extension/string.dart';
import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  static const EdgeInsets _dwPadding = EdgeInsets.all(8); // dataWidgetPadding

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _dwPadding,
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: UiConstant.borderRadius16,
      ),
      child: Padding(
        padding: _dwPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 5),
            FittedBox(
              child: Text(
                title.snakeCaseToString,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(flex: 4),
            Text(
              value,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
