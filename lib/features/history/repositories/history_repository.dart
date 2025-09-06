import 'package:bozorlik/common/extension/datetime_extension.dart';
import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/features/cart/models/cart_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' as material;
import 'package:open_filex/open_filex.dart';

import '../../../common/helpers/request_helper.dart';
import '../../settings/repositories/profile_repository.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Font> _loadFont(String path) async {
  final data = await rootBundle.load(path);
  return Font.ttf(data);
}

Future<void> generateAndOpenPdf(
  material.BuildContext buildContext, {
  required CartModel cart,
}) async {
  final logo = await rootBundle.load('assets/png/logo.png');
  final box = await rootBundle.load('assets/png/box.png');
  final logoBytes = logo.buffer.asUint8List();
  final boxBytes = box.buffer.asUint8List();
  final pdf = Document();
  final font = await _loadFont("assets/fonts/Roboto-Medium.ttf");
  final boldFont = await _loadFont("assets/fonts/Roboto-Bold.ttf");

  pdf.addPage(
    MultiPage(
      pageFormat: PdfPageFormat.a4,
      build:
          (context) => [
            // 🛒 Header
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Image(MemoryImage(logoBytes), height: 40, width: 40),
                //     // shopping cart emoji fallback
                //     SizedBox(width: 8),
                //     Text(
                //       "BOZOR APP",
                //       style: TextStyle(
                //         font: boldFont,
                //         fontSize: 24,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
                Center(
                  child: Image(MemoryImage(logoBytes), height: 120, width: 120),
                ),

                SizedBox(height: 10),
                Divider(color: PdfColors.grey200),
                SizedBox(height: 10),

                // Cart title
                Center(
                  child: Text(
                    "${'shopping'.tr()}: ${cart.name ?? " - "}",
                    style: TextStyle(
                      font: font,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 12),

                // 🛍 Items
                ...(cart.marketLists ?? []).map(
                  (item) => Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: PdfColors.grey200),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          child: Center(
                            child: Image(
                              MemoryImage(boxBytes),
                              height: 30,
                              width: 30,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: PdfColors.grey200,
                          ),
                        ),
                        SizedBox(width: 8),

                        // Left: product name + qty
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              buildContext.localizedTitle(
                                    item.product?.titleUz,
                                    item.product?.titleRu,
                                    item.product?.titleEn,
                                  ) ??
                                  item.productName ??
                                  "-",
                              style: TextStyle(
                                font: font,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "${item.quantity ?? 0} ${item.unit?.name ?? ""}",
                              style: TextStyle(
                                font: font,
                                fontSize: 14,
                                color: PdfColors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),

                        Text(
                          "${item.price?.toStringAsFixed(2) ?? "0"} ${"currency".tr()}",
                          style: TextStyle(
                            font: boldFont,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Divider(color: PdfColors.grey200),
                SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${"product_count".tr()}:",
                      style: TextStyle(
                        font: boldFont,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${cart.marketLists?.length ?? 0} ${"piece".tr()}",
                      style: TextStyle(
                        font: boldFont,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${"total".tr()}:",
                      style: TextStyle(
                        font: boldFont,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${cart.totalPrice ?? 0} ${"currency".tr()}",
                      style: TextStyle(
                        font: boldFont,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${"date".tr()}:",
                      style: TextStyle(
                        font: boldFont,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateTime.tryParse(cart.createdAt ?? "")?.formatDate() ??
                          "",
                      style: TextStyle(
                        font: boldFont,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
