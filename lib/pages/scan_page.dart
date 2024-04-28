import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class ScanPage extends StatefulWidget {
  static const String routeName = '/scan';

  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool isScanOver = false;
  List<String> lines = [];
  String name = '',
      mobile = '',
      email = '',
      address = '',
      website = '',
      company = '',
      image = '',
      designation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Page'),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  getImage(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
                label: const Text('Capture'),
              ),
              TextButton.icon(
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
                icon: const Icon(Icons.photo_album),
                label: const Text('Capture'),
              )
            ],
          ),
          Wrap(
            // children: lines.map((line) => Chip(label: Text(line))).toList(),
            children: lines.map((line) => LineItem(line: line)).toList(),
          )
        ],
      ),
    );
  }

  void getImage(ImageSource source) async {
    final xFile = await ImagePicker().pickImage(source: source);
    if (xFile != null) {
      image = xFile.path;
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final recognizedText =
          await textRecognizer.processImage(InputImage.fromFile(File(image)));
      final tempList = <String>[];
      for (var block in recognizedText.blocks) {
        for (var line in block.lines) {
          tempList.add(line.text);
        }
      }

      setState(() {
        lines = tempList;
        isScanOver = true;
      });
      print(lines);
    }
  }
}

class DropTargetItem extends StatefulWidget {
  final String property;
  final Function(String, String) onDrop;

  const DropTargetItem(
      {super.key, required this.property, required this.onDrop});

  @override
  State<DropTargetItem> createState() => _DropTargetItemState();
}

class _DropTargetItemState extends State<DropTargetItem> {
  String dragItem = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.property),
        DragTarget<String>(
          builder: (context, candidateData, rejectedData) => Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: candidateData.isNotEmpty
                  ? Border.all(color: Colors.red, width: 2)
                  : null,
            ),
            child: Row(
              children: [
                Text(dragItem.isEmpty ? 'Drop Here' : dragItem),
                if (dragItem.isNotEmpty)
                  const Icon(
                    Icons.clear,
                    size: 15,
                  ),
              ],
            ),
          ),
          onAccept: (value) {
            setState(() {
              if (dragItem.isEmpty) {
                dragItem = value;
              } else {
                dragItem += ' $value';
              }
            });

            widget.onDrop(widget.property, dragItem);
          },
        )
      ],
    );
  }
}

class LineItem extends StatelessWidget {
  final String line;

  const LineItem({super.key, required this.line});

  @override
  Widget build(BuildContext context) {
    final GlobalKey _globalKey = GlobalKey();
    return LongPressDraggable(
      data: line,
      dragAnchorStrategy: childDragAnchorStrategy,
      feedback: Container(
        key: _globalKey,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.black45,
        ),
        child: Text(line,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white)),
      ),
      child: Chip(label: Text(line)),
    );
  }
}
