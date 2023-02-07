import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../controller/app_view_model.dart';


class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          decoration: BoxDecoration(
            color: viewModel.clrLvl2,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),

          /// Tasks list
          child: ListView.separated(
            padding: const EdgeInsets.all(15),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15);
            },
            itemCount: viewModel.numTasks,
            itemBuilder: (context, index) {
              /// Arrow to delete task
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  HapticFeedback.mediumImpact();
                  viewModel.deleteTask(index);
                },
                background: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.red.shade700,
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: viewModel.clrLvl1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),

                      ///Check box to make task complete
                      side: BorderSide(
                        width: 2,
                        color: viewModel.clrLvl3,
                      ),
                      checkColor: viewModel.clrLvl1,
                      activeColor: viewModel.clrLvl3,
                      value: viewModel.getTaskValue(index),
                      onChanged: (value) {
                        viewModel.setTaskValue(index, value!);
                      },
                    ),

                    /// Task title
                    title: Text(
                      viewModel.getTaskTitle(index),
                      style: TextStyle(
                        color: viewModel.clrLvl4,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
