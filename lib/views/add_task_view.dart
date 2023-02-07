import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/views/bottom_sheets/add_task_bottom_sheet_view.dart';
import '../controller/app_view_model.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return SizedBox(
        height: 60,
        width: 120,
        /// Add task button
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: viewModel.clrLvl5,
            foregroundColor: viewModel.clrLvl1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            HapticFeedback.heavyImpact();
            viewModel.bottomSheetBuilder(
              ///Add tasks text field
              const AddTaskBottomSheetView(),
              context,
            );
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      );
    });
  }
}
