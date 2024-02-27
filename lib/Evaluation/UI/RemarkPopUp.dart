// Expanded(
// flex: 1, // Allocate 90% of the available space
// child: Stack(
// children: [
// PDFView(
// filePath: widget.pickedFile!.path,
// autoSpacing: true,
// pageFling: true,
// enableSwipe: true,
// swipeHorizontal: true,
// pageSnap: true,
// defaultPage: 0,
// fitPolicy: FitPolicy.WIDTH,
// onPageChanged: (int? page, int? total) {
// setState(() {
// _pageNumberQuestion = page!;
// //_totalPages = total!;
// });
// },
// onViewCreated: (PDFViewController controller) {
// setState(() {
// _pdfViewControllerQuestion = controller;
// });
// },
// ),
// Positioned(
// bottom: 10,
// left: 100,
// child: Container(
// height: 30,
// width: 300,
// decoration: BoxDecoration(
// color: Colors.grey[300],
// borderRadius: BorderRadius.circular(20.0),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: GestureDetector(
// onTap: () {
// if (_pdfViewControllerQuestion != null &&
// _pageNumberQuestion > 0) {
// _pdfViewControllerQuestion
//     .setPage(_pageNumberQuestion - 1);
// }
// },
// child: Icon(
// Icons.arrow_circle_left_outlined,
// color: Colors.black,
// ),
// ),
// ),
// Center(
// child: Text(
// 'Page No. ${_pageNumberQuestion + 1}',
// style: TextStyle(
// fontSize: 18,
// color: Colors.black,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(right: 8.0),
// child: GestureDetector(
// onTap: () {
// if (_pdfViewControllerQuestion != null &&
// _pageNumberQuestion < _totalPages) {
// _pdfViewControllerQuestion
//     .setPage(_pageNumberQuestion + 1);
// }
// },
// child: Icon(
// Icons.arrow_circle_right_outlined,
// color: Colors.black,
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
