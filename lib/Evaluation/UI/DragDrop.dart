// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
//
// class DrawingOnPDF extends StatefulWidget {
//   @override
//   _DrawingOnPDFState createState() => _DrawingOnPDFState();
// }
//
// class _DrawingOnPDFState extends State<DrawingOnPDF> {
//   List<Offset?> points = <Offset?>[];
//   MyPainter? _painter;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Draw on PDF'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.undo),
//             onPressed: () {
//               if (_painter != null) {
//                 _painter!.undo();
//               }
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.clear),
//             onPressed: () {
//               if (_painter != null) {
//                 _painter!.clear();
//               }
//             },
//           ),
//         ],
//       ),
//       body: GestureDetector(
//         onPanUpdate: (DragUpdateDetails details) {
//           setState(() {
//             RenderBox renderBox = context.findRenderObject() as RenderBox;
//             points.add(renderBox.globalToLocal(details.globalPosition));
//           });
//         },
//         onPanEnd: (DragEndDetails details) {
//           points.add(null);
//         },
//         child: Stack(
//           children: [
//             Container(
//               height: 700,
//               width: 500,
//               child: PDFView(
//                 filePath:
//                     '/data/user/0/com.example.question_paper_evaluation/cache/file_picker/Megha_Gupta_Resume.pdf', // Change to your PDF file path
//                 autoSpacing: true,
//                 pageFling: true,
//                 enableSwipe: true,
//                 swipeHorizontal: true,
//                 pageSnap: true,
//                 defaultPage: 0,
//                 fitPolicy: FitPolicy.WIDTH,
//               ),
//             ),
//             CustomPaint(
//               painter: _painter = MyPainter(
//                 points: points,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MyPainter extends CustomPainter {
//   MyPainter({required this.points}) : undoStack = [];
//
//   final List<Offset?> points;
//   final List<List<Offset?>> undoStack;
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 5.0;
//
//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i] != null && points[i + 1] != null) {
//         canvas.drawLine(points[i]!, points[i + 1]!, paint);
//       }
//     }
//   }
//
//   void undo() {
//     if (points.isNotEmpty) {
//       undoStack.add(List.of(points));
//       points.clear();
//     }
//   }
//
//   void redo() {
//     if (undoStack.isNotEmpty) {
//       points.addAll(undoStack.removeLast());
//     }
//   }
//
//   void clear() {
//     points.clear();
//     undoStack.clear();
//   }
//
//   void undoRecentPaint() {
//     if (undoStack.isNotEmpty) {
//       points.clear();
//       points.addAll(undoStack.removeLast());
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
