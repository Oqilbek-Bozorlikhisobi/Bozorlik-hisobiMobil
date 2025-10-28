// import 'package:bozorlik/common/extension/for_context.dart';
// import 'package:bozorlik/common/extension/number_extension.dart';
// import 'package:bozorlik/common/widgets/custom_network_image.dart';
// import 'package:bozorlik/features/home/notifiers/banners_notifier.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// class BannersWidget extends ConsumerWidget {
//   const BannersWidget({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final banners = ref.watch(bannersNotifierProvider);
//     return banners.when(
//       data: (data) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 16.0),
//           child: CarouselSlider(
//             options: CarouselOptions(
//               // height: 130.0,
//               aspectRatio: 3 / 1,
//               autoPlay: banners.isLoading == false,
//             ),
//             items:
//                 data.map((banner) {
//                   return Builder(
//                     builder: (BuildContext context) {
//                       return Container(
//                         clipBehavior: Clip.hardEdge,
//                         width: MediaQuery.of(context).size.width,
//                         margin: EdgeInsets.symmetric(horizontal: 5.0),
//                         decoration: BoxDecoration(
//                           color: CupertinoColors.systemGroupedBackground,
//                           borderRadius: BorderRadiusGeometry.circular(12),
//                         ),
//                         child: Stack(
//                           children: [
//                             Positioned.fill(
//                               child: CustomCachedNetworkImage(
//                                 imageUrl:
//                                     context.localizedTitle(
//                                       banner.imageUz,
//                                       banner.imageRu,
//                                       banner.imageEn,
//                                     ) ??
//                                     "",
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             Positioned.fill(
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                     begin: Alignment.bottomCenter,
//                                     end: Alignment.center,
//                                     colors: [
//                                       CupertinoColors.black.withOpacity(0.45),
//                                       CupertinoColors.transparent,
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             // Positioned(
//                             //   bottom: 8,
//                             //   left: 8,
//                             //   right: 8,
//                             //   child: Text(
//                             //     context.localizedTitle(
//                             //           banner.nameUz,
//                             //           banner.nameRu,
//                             //           banner.nameEn,
//                             //         ) ??
//                             //         "",
//                             //     style: TextStyle(
//                             //       fontWeight: FontWeight.w800,
//                             //       color: CupertinoColors.white,
//                             //       fontSize: 16,
//                             //       overflow: TextOverflow.ellipsis,
//                             //     ),
//                             //     maxLines: 1,
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//           ),
//         );
//       },
//       error: (e, s) {
//         return 0.vertical;
//       },
//       loading: () {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 16.0),
//           child: CarouselSlider(
//             options: CarouselOptions(height: 120.0, autoPlay: true),
//             items:
//                 [1, 2, 3].map((i) {
//                   return Builder(
//                     builder: (BuildContext context) {
//                       return Container(
//                         width: MediaQuery.of(context).size.width,
//                         margin: EdgeInsets.symmetric(horizontal: 5.0),
//                         decoration: BoxDecoration(
//                           color: CupertinoColors.systemGroupedBackground,
//                           borderRadius: BorderRadiusGeometry.circular(12),
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/home/bloc/home_bloc.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingBanner extends StatefulWidget {
  const OnboardingBanner({super.key, required this.bloc});

  final HomeBloc bloc;

  @override
  State<OnboardingBanner> createState() => _OnboardingBannerState();
}

class _OnboardingBannerState extends State<OnboardingBanner> {
  int _current = 0;

  Future<void> _openLink(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('URL ochilmadi');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            state.statusBanner == Status.loading
                ? Column(children: [LoadingWidget(), 20.vertical])
                : state.statusBanner == Status.error
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      widget.bloc.add(GetBannerEvent());
                    },
                    child: Stack(
                      children: [
                        // SvgPicture.asset(AppIcons.noInternet),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.refresh),
                              Text(
                                state.errorMessageMarket ?? "Xatolik",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                : state.statusBanner == Status.success
                ? Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        aspectRatio: 2.0,
                        height: 170,
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 800,
                        ),
                        initialPage: 0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items:
                          state.banner?.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),

                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Stack(
                                      children: [
                                        // Positioned.fill(child: SvgPicture.asset(AppIcons.splash, fit: BoxFit.fitWidth)),
                                        Positioned.fill(
                                          child: Opacity(
                                            opacity: 0.9,
                                            child: Builder(
                                              builder: (context) {
                                                final currentLocale =
                                                    context
                                                        .locale
                                                        .languageCode;

                                                // Tilga qarab title-ni tanlash
                                                String getTitle() {
                                                  switch (currentLocale) {
                                                    case 'uz':
                                                      return item
                                                          .imageUz ??
                                                          "";
                                                    case 'ky':
                                                      return item
                                                          .imageUzk ??
                                                          "";
                                                    case 'ru':
                                                      return item
                                                          .imageRu ??
                                                          "";
                                                    case 'en':
                                                      return item
                                                          .imageEn ??
                                                          "";
                                                    default:
                                                      return item
                                                          .imageUz ??
                                                          "";
                                                  }
                                                }
                                                return Image.network(
                                                  getTitle() ?? "",
                                                  fit: BoxFit.fitWidth,
                                                );
                                              }
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {


                                                        return Text(
                                                          maxLines: 2,
                                                          overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          "",
                                                          style: Theme.of(
                                                                context,
                                                              )
                                                              .textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                    // 6.vertical,
                                                    // Text(
                                                    //   maxLines: 2,
                                                    //   overflow: TextOverflow.ellipsis,
                                                    //   item.nameUz??"",
                                                    //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                    //     fontWeight: FontWeight.w400,
                                                    //     fontSize: 12,
                                                    //     color: Colors.white.withOpacity(0.9),
                                                    //     height: 1.4,
                                                    //   ),
                                                    // ),
                                                    // const SizedBox(height: 5),
                                                    Spacer(),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        _openLink(
                                                          item.link ?? "",
                                                        );
                                                        // final Uri url = Uri.parse('${item.link}');
                                                        // if (await canLaunchUrl(url)) {
                                                        // await launchUrl(url, mode: LaunchMode.externalApplication);
                                                        // } else {
                                                        // ScaffoldMessenger.of(context).showSnackBar(
                                                        // const SnackBar(content: Text('Linkni ochib bo‘lmadi')),
                                                        // );
                                                        // }
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 4,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8,
                                                              ),
                                                        ),
                                                        child: Text(
                                                          overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          "details".tr(),
                                                          style: Theme.of(
                                                                context,
                                                              )
                                                              .textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                color:
                                                                    AppColors
                                                                        .primaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // 5.horizontal,
                                              // Expanded(
                                              //   flex: 4,
                                              //   child: Stack(
                                              //     alignment: Alignment.center,
                                              //     children: [
                                              //       SizedBox(
                                              //         width: 140,
                                              //         height: 180,
                                              //         child: ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.network(item.image??"")),
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                    ),
                    10.vertical,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          (state.banner ?? []).asMap().entries.map((entry) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: _current == entry.key ? 42 : 10,
                              height: 4,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    _current == entry.key
                                        ? AppColors.primaryColor
                                        : CupertinoColors.systemGrey5,
                              ),
                            );
                          }).toList(),
                    ),
                    10.vertical,
                  ],
                )
                : SizedBox(),
          ],
        );
      },
    );
  }
}

class DiagonalLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    const spacing = 20.0;
    for (double i = -size.height; i < size.width + size.height; i += spacing) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
