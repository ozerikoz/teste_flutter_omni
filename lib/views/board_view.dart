import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_teste_omni/views/components/board_column.dart';
import 'package:flutter_teste_omni/models/board_column/board_column_model.dart';
import 'package:get/get.dart';
import 'package:flutter_teste_omni/controllers/board_controller.dart';

class BoardView extends StatefulWidget {
  const BoardView({super.key});

  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  late BoardController boardController;

  @override
  void initState() {
    super.initState();
    boardController = Get.find<BoardController>();
    boardController.getColumns();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          boardController.addColumn(
            BoardColumnModel(
              id: "",
              title: "",
              tasks: [],
            ),
          );
        },
        child: Icon(Icons.add_rounded),
      ),
      appBar: AppBar(
        title: const Text('Teste Omni Saúde - Board 1'),
      ),
      body: SafeArea(
        child: Obx(
          () {
            return boardController.isLoading.value
                ? Center(
                    child: SizedBox(
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator()),
                  )
                : ScrollConfiguration(
                    behavior: ScrollBehavior().copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch,
                      },
                    ),
                    child: Scrollbar(
                      child: ReorderableListView.builder(
                        primary: true,
                        clipBehavior: Clip.none,
                        buildDefaultDragHandles: false,
                        scrollDirection: Axis.horizontal,
                        onReorder: boardController.onReorder,
                        itemCount: boardController.boardColumns.length,
                        prototypeItem: BoardColumn(
                          index: 0,
                          column:
                              BoardColumnModel(id: '', title: '', tasks: []),
                          onTaskMoved: (task, s) {},
                        ),
                        proxyDecorator: (child, index, animation) {
                          return Material(
                            color: Colors.transparent,
                            child: child,
                          );
                        },
                        itemBuilder: (context, index) {
                          final column = boardController.boardColumns[index];
                          return ReorderableDelayedDragStartListener(
                            index: index,
                            key: ValueKey(column.id),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 8,
                              ),
                              child: BoardColumn(
                                index: index,
                                column: column,
                                onTaskMoved: (task, newColumnTitle) {},
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
