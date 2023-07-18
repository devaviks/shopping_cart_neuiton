import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'dart:typed_data';

Future<void> generatePDF(String orderId, String itemName, double price) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Container(
          padding: pw.EdgeInsets.all(16.0),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Order Details',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 16),
              pw.Text('Order ID: $orderId'),
              pw.SizedBox(height: 8),
              pw.Text('Item Name: $itemName'),
              pw.SizedBox(height: 8),
              pw.Text('Price: ₹ ${price.toStringAsFixed(2)}'),
              // Add more details as needed
              // ...
            ],
          ),
        );
      },
    ),
  );

  // Save the PDF file
  final output = await getExternalStorageDirectory();
  final filePath = '${output?.path}/invoice.pdf';

  final permissionStatus = await Permission.storage.request();
  if (permissionStatus.isGranted) {
    final Uint8List pdfData = await pdf.save();
    final buffer = pdfData.buffer;
    final file = File(filePath);
    await file.writeAsBytes(buffer.asUint8List());
    print('PDF saved at: $filePath');
  } else {
    print('Permission denied');
  }
}