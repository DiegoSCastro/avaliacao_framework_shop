import 'dart:io';

import 'package:avaliacao_framework_shop/helpers/extensions.dart';
import 'package:avaliacao_framework_shop/models/product.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share/share.dart';

class PdfApi {
  static Future<File> generatePdfCoupon(
      String text, List<Product> products) async {
    final pdf = pw.Document();
    final font =
        await rootBundle.load("assets/fonts/OpenSans/OpenSans-Medium.ttf");
    final ttf = pw.Font.ttf(font);

    final tableHeader = ['Produto', 'Quantidade', 'Preço', 'Total'];
    final data = products
        .map((p) => [
              p.name,
              '${p.quantity} kg',
              p.price.formattedMoney(),
              (p.quantity * p.price).formattedMoney(),
            ])
        .toList();
    final netTotal = products
        .map((p) => p.price * p.quantity)
        .reduce((item1, item2) => item1 + item2);

    pdf.addPage(pw.MultiPage(
        build: (context) => [
              _buildHeader(text, ttf),
              _buildTable(tableHeader, data),
              _buildTotal(netTotal),
            ]));

    return saveDocument(name: 'Compras-Framework-Shop.pdf', pdf: pdf);
  }

  static pw.Container _buildTotal(double netTotal) {
    return pw.Container(
      alignment: pw.Alignment.centerRight,
      child:
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
        pw.Divider(),
        pw.Container(
          padding: const pw.EdgeInsets.only(right: PdfPageFormat.cm * 2),
          child: pw.Text('Total: ${netTotal.formattedMoney()}',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        ),
        pw.Divider(),
      ]),
    );
  }

  static pw.Header _buildHeader(String text, pw.Font ttf) {
    return pw.Header(
      child: pw.Text(
        text,
        style: pw.TextStyle(
            font: ttf, fontSize: 24, fontWeight: pw.FontWeight.bold),
      ),
    );
  }

  static pw.Table _buildTable(
      List<String> tableHeader, List<List<String>> data) {
    return pw.Table.fromTextArray(
        headers: tableHeader,
        data: data,
        border: null,
        headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
        cellHeight: 30,
        cellAlignments: {
          0: pw.Alignment.centerLeft,
          1: pw.Alignment.center,
          2: pw.Alignment.centerLeft,
          3: pw.Alignment.centerLeft,
        });
  }

  static Future<File> saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }

  static Future shareFile(File file) async {
    final url = file.path;

    await Share.shareFiles([url], text: 'Compras Framework Shop');
  }
}
