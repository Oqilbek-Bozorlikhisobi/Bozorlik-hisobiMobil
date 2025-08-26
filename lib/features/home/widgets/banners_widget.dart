import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_network_image.dart';
import 'package:bozorlik/features/home/notifiers/banners_notifier.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BannersWidget extends ConsumerWidget {
  const BannersWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banners = ref.watch(bannersNotifierProvider);
    return banners.when(
      data: (data) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CarouselSlider(
            options: CarouselOptions(
              // height: 130.0,
              aspectRatio: 3 / 1,
              autoPlay: banners.isLoading == false,
            ),
            items:
                data.map((banner) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGroupedBackground,
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: CustomCachedNetworkImage(
                                imageUrl:
                                    context.localizedTitle(
                                      banner.imageUz,
                                      banner.imageRu,
                                      banner.imageEn,
                                    ) ??
                                    "",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.center,
                                    colors: [
                                      CupertinoColors.black.withOpacity(0.45),
                                      CupertinoColors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Positioned(
                            //   bottom: 8,
                            //   left: 8,
                            //   right: 8,
                            //   child: Text(
                            //     context.localizedTitle(
                            //           banner.nameUz,
                            //           banner.nameRu,
                            //           banner.nameEn,
                            //         ) ??
                            //         "",
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.w800,
                            //       color: CupertinoColors.white,
                            //       fontSize: 16,
                            //       overflow: TextOverflow.ellipsis,
                            //     ),
                            //     maxLines: 1,
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
          ),
        );
      },
      error: (e, s) {
        return 0.vertical;
      },
      loading: () {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CarouselSlider(
            options: CarouselOptions(height: 120.0, autoPlay: true),
            items:
                [1, 2, 3].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGroupedBackground,
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      );
                    },
                  );
                }).toList(),
          ),
        );
      },
    );
  }
}
