import 'package:bozorlik/common/extension/datetime_extension.dart';
import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/features/cart/models/cart_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_filex/open_filex.dart';

import '../../../common/helpers/request_helper.dart';
import '../../settings/repositories/profile_repository.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<pw.Font> _loadFont(String path) async {
  final data = await rootBundle.load(path);
  return pw.Font.ttf(data);
}

Future<void> generateAndOpenPdf(
  BuildContext buildContext, {
  required CartModel cart,
}) async {
  final logo = await rootBundle.load('assets/png/logo.png');
  final box = await rootBundle.load('assets/png/box.png');
  final logoBytes = logo.buffer.asUint8List();
  final boxBytes = box.buffer.asUint8List();
  final pdf = pw.Document();
  final font = await _loadFont("assets/fonts/Roboto-Medium.ttf");
  final boldFont = await _loadFont("assets/fonts/Roboto-Bold.ttf");

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build:
          (context) => [
            // 🛒 Header
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Image(pw.MemoryImage(logoBytes), height: 40, width: 40),
                    // shopping cart emoji fallback
                    pw.SizedBox(width: 8),
                    pw.Text(
                      "Market APP",
                      style: pw.TextStyle(
                        font: boldFont,
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Divider(color: PdfColors.grey200),
                pw.SizedBox(height: 10),

                // Cart title
                pw.Center(
                  child: pw.Text(
                    cart.name ?? "-",
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),

                pw.SizedBox(height: 12),

                // 🛍 Items
                ...(cart.marketLists ?? []).map(
                  (item) => pw.Container(
                    padding: const pw.EdgeInsets.only(bottom: 8),
                    margin: const pw.EdgeInsets.symmetric(vertical: 6),
                    decoration: pw.BoxDecoration(
                      border: pw.Border(
                        bottom: pw.BorderSide(color: PdfColors.grey200),
                      ),
                    ),
                    child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Container(
                          height: 70,
                          width: 70,
                          child: pw.Center(
                            child: pw.Image(
                              pw.MemoryImage(boxBytes),
                              height: 30,
                              width: 30,
                            ),
                          ),
                          decoration: pw.BoxDecoration(
                            borderRadius: pw.BorderRadius.circular(8),
                            color: PdfColors.grey200,
                          ),
                        ),
                        pw.SizedBox(width: 8),

                        // Left: product name + qty
                        pw.Column(
                          mainAxisSize: pw.MainAxisSize.min,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              buildContext.localizedTitle(
                                    item.product?.titleUz,
                                    item.product?.titleRu,
                                    item.product?.titleEn,
                                  ) ??
                                  item.productName ??
                                  "-",
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 16,
                                fontWeight: pw.FontWeight.normal,
                              ),
                            ),
                            pw.SizedBox(height: 2),
                            pw.Text(
                              "${item.quantity ?? 0} ${item.unit?.name ?? ""}",
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 14,
                                color: PdfColors.grey,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            // if (item.user?.fullName != null)
                            //   pw.Text(
                            //     "${item.user!.fullName!}",
                            //     style: pw.TextStyle(
                            //       font: font,
                            //       fontSize: 12,
                            //       fontWeight: pw.FontWeight.bold,
                            //     ),
                            //   ),
                          ],
                        ),
                        pw.Spacer(),

                        // Right: price
                        pw.Text(
                          "${item.price?.toStringAsFixed(2) ?? "0"} ${"currency".tr()}",
                          style: pw.TextStyle(
                            font: boldFont,
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                pw.Divider(color: PdfColors.grey200),
                pw.SizedBox(height: 8),

                // // ✅ Summary
                // pw.Text(
                //   "Mahsulotlar soni: ${cart.marketLists?.length ?? 0} dona",
                //   style: pw.TextStyle(
                //     font: font,
                //     fontWeight: pw.FontWeight.bold,
                //   ),
                // ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "${"total".tr()}:",
                      style: pw.TextStyle(
                        font: boldFont,
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      "${cart.totalPrice ?? 0} ${"currency".tr()}",
                      style: pw.TextStyle(
                        font: boldFont,
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "${"date".tr()}:",
                      style: pw.TextStyle(
                        font: boldFont,
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      DateTime.tryParse(cart.createdAt ?? "")?.formatDate() ??
                          "",
                      style: pw.TextStyle(
                        font: boldFont,
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
    ),
  );

  // Save to temp and open
  final dir = await getTemporaryDirectory();
  final file = File("${dir.path}/cart_${cart.id}.pdf");
  await file.writeAsBytes(await pdf.save());
  await OpenFilex.open(file.path);
}

class HistoryRepository {
  Future<List<CartModel>> getHistory() async {
    final userId = ProfileRepository().id;
    final response = await requestHelper.getWithAuth("/history?userId=$userId");
    try {
      return (response["data"] as List)
          .map((e) => CartModel.fromJson(e))
          .toList();
    } catch (e, s) {
      print(e);
      rethrow;
    }
  }
}

final historyRepository = HistoryRepository();
