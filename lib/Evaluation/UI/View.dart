import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class MyView extends StatefulWidget {
  final File? pickedFile;

  MyView({Key? key, this.pickedFile}) : super(key: key);

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  File? answerkeydoc;
  List<Offset?> points = <Offset?>[];
  MyPainter? _painter;
  Color circleColor = Colors.white;
  final List<Map<String, dynamic>> allQuestions = [
    {'question': 1, 'marks': 1},
    {'question': 2, 'marks': 3},
    {'question': 3, 'marks': 2},

    // Add more questions and marks as needed
  ];
  List<String> questionNames = [
    'Which of the following type of reaction is taking place in the chemical equation given below?',
    'Explain Arrays?',
    'Feature of OOps?',
    'Short Description of Bloc?'
  ];
  List<Offset> _tapPositions = [];
  int _pageNumberQuestion = 1;
  int selectedCircleIndexMarks = -1;
  int selectedBoxIndexMarks = -1;
  int _pageNumberAnswer = 1;
  int remarkQuestionNo = 1;
  int _totalPages = 3;
  int totalQuestions = 15;
  String enteredText = '';
  bool visibleRemark = false;
  late PDFViewController _pdfViewControllerQuestion;
  late PDFViewController _pdfViewControllerAnswer;

  @override
  void initState() {
    //loadDocument();
  }
  void openQP(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.9,
            child: PDFView(
              filePath: widget
                  .pickedFile?.path, // Replace with the path to your PDF file
              autoSpacing: true,
              pageFling: true,
              enableSwipe: true,
              swipeHorizontal: true,
              pageSnap: true,
              defaultPage: 0,
              fitPolicy: FitPolicy.WIDTH,
              onPageChanged: (int? page, int? total) {
                // Handle page change if needed
              },
              onViewCreated: (PDFViewController controller) {
                // Handle PDF view controller if needed
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> loadDocument() async {
    String answerkey = "C:/Users/megha/Downloads/answer_key.pdf";
    print(answerkey);
    if (answerkey.isNotEmpty) {
      print(answerkey);
      setState(() {
        answerkeydoc = File(answerkey);
      });
    } else {
      print('Invalid path');
    }
  }

  //
  double Marks(index) {
    // For even indexes, calculate the corresponding half value
    //print((index / 2) + 0.5);
    return (index / 2) + 0.5;
  }

  void _showPopup(BuildContext context) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.4,
        left: MediaQuery.of(context).size.width * 0.4,
        child: GestureDetector(
          onTap: () {
            overlayEntry!.remove();
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.45,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      width: 400,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 300,
                              width: 70,
                              decoration: BoxDecoration(
                                  // border: Border.all(
                                  //   color: Colors.grey,
                                  // ),
                                  ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10),
                                        GestureDetector(
                                          onTap: () {
                                            print('Button Clicked!');
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(18.0),
                                                bottomRight:
                                                    Radius.circular(18.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  offset: Offset(
                                                      1, 5), // X and Y offset
                                                  blurRadius: 5,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Excellent',
                                                    style: TextStyle(),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        5, // Add space between text and icon
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        GestureDetector(
                                          onTap: () {
                                            print('Button Clicked!');
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(18.0),
                                                bottomRight:
                                                    Radius.circular(18.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  offset: Offset(
                                                      1, 5), // X and Y offset
                                                  blurRadius: 5,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Good',
                                                    style: TextStyle(),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        5, // Add space between text and icon
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            print('Button Clicked!');
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(18.0),
                                                bottomRight:
                                                    Radius.circular(18.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  offset: Offset(
                                                      1, 5), // X and Y offset
                                                  blurRadius: 5,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Excellent',
                                                    style: TextStyle(),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        5, // Add space between text and icon
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            print('Button Clicked!');
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(18.0),
                                                bottomRight:
                                                    Radius.circular(18.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  offset: Offset(
                                                      1, 5), // X and Y offset
                                                  blurRadius: 5,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Better',
                                                    style: TextStyle(),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        5, // Add space between text and icon
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            print('Button Clicked!');
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(18.0),
                                                bottomRight:
                                                    Radius.circular(18.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  offset: Offset(
                                                      1, 5), // X and Y offset
                                                  blurRadius: 5,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Excellent',
                                                    style: TextStyle(),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        5, // Add space between text and icon
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            print('Button Clicked!');
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(18.0),
                                                bottomRight:
                                                    Radius.circular(18.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  offset: Offset(
                                                      1, 5), // X and Y offset
                                                  blurRadius: 5,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Bad',
                                                    style: TextStyle(),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        5, // Add space between text and icon
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Add other GestureDetector widgets similarly
                                      ],
                                    ),
                                  ),
                                  // Add other Expanded widgets similarly
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 20.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            if (_pdfViewControllerAnswer !=
                                                    null &&
                                                _pageNumberAnswer > 0) {
                                              _pdfViewControllerAnswer.setPage(
                                                  _pageNumberAnswer - 1);
                                            }
                                            setState(() {
                                              remarkQuestionNo--;
                                            });
                                          },
                                          child: Icon(
                                            Icons.arrow_circle_left_outlined,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'Remark : Question No. ${remarkQuestionNo}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            if (_pdfViewControllerAnswer !=
                                                    null &&
                                                _pageNumberAnswer <
                                                    _totalPages) {
                                              _pdfViewControllerAnswer.setPage(
                                                  _pageNumberAnswer + 1);
                                            }
                                            setState(() {
                                              remarkQuestionNo++;
                                            });
                                          },
                                          child: Icon(
                                            Icons.arrow_circle_right_outlined,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      8.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: TextField(
                                      onChanged: (text) {
                                        setState(() {
                                          enteredText = text;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Type your text here',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Paper Evaluation',
            style: TextStyle(
              color: Color(0xff1170CE),
            ),
          ),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Final Exam',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            Text('P100963',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            Text('Science',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (_pdfViewControllerAnswer != null &&
                                    _pageNumberAnswer > 0) {
                                  _pdfViewControllerAnswer
                                      .setPage(_pageNumberAnswer - 1);
                                }
                              },
                              child: Container(
                                width: 70,
                                color: Color(0xff1170CE),
                                child: Center(
                                  child: Text(
                                    'Q${_pageNumberAnswer + 1}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    questionNames[_pageNumberAnswer %
                                        questionNames.length],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_pdfViewControllerAnswer != null &&
                                    _pageNumberAnswer < _totalPages) {
                                  _pdfViewControllerAnswer
                                      .setPage(_pageNumberAnswer + 1);
                                }
                              },
                              child: Container(
                                width: 70,
                                color: Colors.grey,
                                child: Center(
                                  child: Text(
                                    'Q${_pageNumberAnswer + 2}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                        // Just for demonstration
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Model Answer Key',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      PDFView(
                                        filePath: widget.pickedFile!.path,
                                        autoSpacing: true,
                                        pageFling: true,
                                        enableSwipe: true,
                                        swipeHorizontal: true,
                                        pageSnap: true,
                                        defaultPage: 0,
                                        fitPolicy: FitPolicy.WIDTH,
                                        onPageChanged: (int? page, int? total) {
                                          setState(() {
                                            _pageNumberAnswer = page!;
                                            // _totalPages = total!;
                                          });
                                        },
                                        onViewCreated:
                                            (PDFViewController controller) {
                                          setState(() {
                                            _pdfViewControllerAnswer =
                                                controller;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1, // Allocate 5% of the available space
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                //color: Colors.green,
                                ),
                            child: GridView.count(
                              shrinkWrap: true, // Add shrinkWrap property
                              crossAxisCount:
                                  1, // Adjust the number of circles per row as needed
                              crossAxisSpacing:
                                  15, // Adjust spacing between circles as needed
                              mainAxisSpacing:
                                  15, // Adjust spacing between rows as needed
                              children: List.generate(
                                1, // Total number of circles based on the number of questions
                                (index) {
                                  int marks =
                                      allQuestions[_pageNumberAnswer]['marks'];
                                  int circleCount = marks * 2 +
                                      1; // Calculate the number of circles based on marks
                                  return Column(
                                    children: [
                                      ...List.generate(
                                        circleCount,
                                        (circleIndex) {
                                          double circleValue = circleIndex / 2;
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedCircleIndexMarks =
                                                    index * circleCount +
                                                        circleIndex;
                                              });
                                              String answer =
                                                  Marks(index).toString();
                                              print(answer);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Container(
                                                width:
                                                    42, // Adjust circle size as needed
                                                height:
                                                    42, // Adjust circle size as needed
                                                decoration: BoxDecoration(
                                                  color: index * circleCount +
                                                              circleIndex ==
                                                          selectedCircleIndexMarks
                                                      ? Color(0xff1170CE)
                                                      : Colors.white,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: index * circleCount +
                                                                circleIndex ==
                                                            selectedCircleIndexMarks
                                                        ? Colors.white
                                                        : Colors.grey,
                                                  ),
                                                ),
                                                // Just for demonstration
                                                child: Center(
                                                  child: Text(
                                                    '${circleValue.toStringAsFixed(1)}', // Assuming circles are 1-indexed
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: index * circleCount +
                                                                  circleIndex ==
                                                              selectedCircleIndexMarks
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                              //color: Colors.blue,
                              ),
                          child: Column(
                            children: [
                              Text(
                                'Tools',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('Right Click');
                                },
                                child: Image.asset(
                                  'assets/images/Right.png',
                                  height: 45, // Specify the desired height
                                  width: 45,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('Wrong Click');
                                },
                                child: Image.asset(
                                  'assets/images/Wrong.png',
                                  height: 50, // Specify the desired height
                                  width: 50,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // visibleRemark == false
                                  //     ? {
                                  //         _showPopup(context),
                                  //         setState(() {
                                  //           visibleRemark = true;
                                  //         }),
                                  //       }
                                  //     : null;
                                  _showPopup(context);
                                },
                                child: Image.asset(
                                  'assets/images/remark.png',
                                  height: 40, // Specify the desired height
                                  width: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 9, // Allocate 90% of the available space
                    child: Stack(
                      children: [
                        PDFView(
                          filePath: widget.pickedFile!.path,
                          autoSpacing: true,
                          pageFling: true,
                          enableSwipe: true,
                          swipeHorizontal: true,
                          pageSnap: true,
                          defaultPage: 0,
                          fitPolicy: FitPolicy.WIDTH,
                          onPageChanged: (int? page, int? total) {
                            setState(() {
                              _pageNumberQuestion = page!;
                            });
                          },
                          onViewCreated: (PDFViewController controller) {
                            setState(() {
                              _pdfViewControllerQuestion = controller;
                            });
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          left: 100,
                          child: Container(
                            height: 30,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_pdfViewControllerQuestion != null &&
                                          _pageNumberQuestion > 0) {
                                        _pdfViewControllerQuestion
                                            .setPage(_pageNumberQuestion - 1);
                                      }
                                    },
                                    child: Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'Page No. ${_pageNumberQuestion + 1}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_pdfViewControllerQuestion != null &&
                                          _pageNumberQuestion < _totalPages) {
                                        _pdfViewControllerQuestion
                                            .setPage(_pageNumberQuestion + 1);
                                      }
                                    },
                                    child: Icon(
                                      Icons.arrow_circle_right_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1, // Allocate 5% of the available space
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 70,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xff1170CE),
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    openQP(context);
                                  },
                                  child: Text(
                                    'View QP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: 600,
                            decoration: BoxDecoration(
                                //color: Colors.green,
                                ),
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 0,
                              children: List.generate(
                                totalQuestions,
                                (circleIndex) {
                                  double QuestionNo =
                                      circleIndex + 1; // Incrementing by 1
                                  bool isSelected =
                                      circleIndex == selectedBoxIndexMarks;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedBoxIndexMarks = circleIndex;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Container(
                                        width: 20,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Color(0xff1170CE)
                                              : Colors.white,
                                          // Change shape to square
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Q${QuestionNo.toStringAsFixed(0)}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class MyPainter extends CustomPainter {
  MyPainter({required this.points}) : undoStack = [];

  final List<Offset?> points;
  final List<List<Offset?>> undoStack;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    print('paint');
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        print('paint1');
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  void undo() {
    if (points.isNotEmpty) {
      undoStack.add(List.of(points));
      points.clear();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
