// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:question_paper_evaluation/features/Evaluation/UI/View.dart';
//
// class PDFViewerScreen extends StatefulWidget {
//   @override
//   _PDFViewerScreenState createState() => _PDFViewerScreenState();
// }
//
// class _PDFViewerScreenState extends State<PDFViewerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () async {
//                 File? pickedFile = await pickPDF(context);
//                 if (pickedFile != null) {
//                   // Further processing with the picked file
//                   print('Picked file: ${pickedFile.path}');
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MyView(pickedFile: pickedFile),
//                     ),
//                   );
//                 } else {
//                   print('User canceled the picker');
//                 }
//               },
//               child: Text('Pick PDF'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<File?> pickPDF(BuildContext context) async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//
//     if (result != null) {
//       if (result.files.single.path != null) {
//         File file = File(result.files.single.path!);
//         return file;
//         // Further processing with the file...
//       }
//       // Here, you can perform actions with the picked file, such as uploading it.
//       // For example, you can use a network library like http to upload the file.
//     } else {
//       // User canceled the picker
//     }
//   }
// }
//
import 'dart:io';

import 'package:evaluation/Evaluation/UI/View.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class EvaluationScreen extends StatefulWidget {
  @override
  _EvaluationScreenState createState() => _EvaluationScreenState();
}

class _EvaluationScreenState extends State<EvaluationScreen> {
  //String _filePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: FloatingActionButton(
        onPressed: () async {
          File? pickedFile = await pickPDF(context);
          if (pickedFile != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyView(pickedFile: pickedFile),
              ),
            );
          } else {
            print('User canceled the picker');
          }
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<File?> pickPDF(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      if (result.files.single.path != null) {
        File file = File(result.files.single.path!);
        return file;
      }
    }
    return null;
  }
}
