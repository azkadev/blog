// ignore_for_file: non_constant_identifier_names

/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */

import 'package:blog/widget/blog_container.dart';
import 'package:flutter/material.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:blog/page/blog/blog.dart';
import 'package:blog/scheme/scheme.dart';
import 'package:blog/widget/author.dart';
import 'package:blog/widget/footer.dart';

class LandingPageBlog extends StatefulWidget {
  final BlogHomeData blogHomeData;
  final List<BlogsData> blogsDatas;
  final GeneralLibFlutterApp generalLibFlutterApp;
  const LandingPageBlog({
    super.key,
    required this.blogHomeData,
    required this.blogsDatas,
    required this.generalLibFlutterApp,
  });

  @override
  State<LandingPageBlog> createState() => _LandingPageBlogState();
}

class _LandingPageBlogState extends State<LandingPageBlog> {
  final GlobalKey globalKey = GlobalKey();
  final ScrollControllerAutoKeepStateData scroll_controller_auto__keep_state_data = ScrollControllerAutoKeepStateData(keyId: "blog_page_landing");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      refresh();
    });
  }

  Future<void> refresh() async {
    setState(() {});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          context.width,
          450,
        ),
        child: Container(
          key: globalKey,
          decoration: BoxDecoration(
            // borderRadius: const BorderRadius.only(
            //   bottomLeft: Radius.circular(40),
            //   bottomRight: Radius.circular(40),
            // ),
            color: context.theme.dialogBackgroundColor.withOpacity(0.85),
            boxShadow: [
              BoxShadow(
                color: context.theme.shadowColor.withAlpha(110),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.mediaQueryData.padding.top,
              ),
              Builder(
                builder: (context) {
                  List<Widget> children = [
                    TextButton(
                      onPressed: () async {
                        context.navigator().pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return LandingPageBlog(
                              blogHomeData: widget.blogHomeData,
                              blogsDatas: widget.blogsDatas,
                              generalLibFlutterApp: widget.generalLibFlutterApp,
                            );
                          },
                        ));
                      },
                      child: Text(
                        "${widget.blogHomeData.title}".trim(),
                        style: TextStyle(
                          color: context.theme.indicatorColor,
                          shadows: [
                            BoxShadow(
                              color: context.theme.shadowColor.withAlpha(110),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                    // auto change theme
                    Builder(
                      builder: (context) {
                        // theme mode
                        return IconButton(
                          onPressed: () {
                            widget.generalLibFlutterApp.autoChangeTheme(
                              onChangeBrightness: () {
                                return context.mediaQueryData.platformBrightness;
                              },
                            );
                            setState(() {});
                          },
                          icon: Icon(
                            () {
                              if (widget.generalLibFlutterApp.themeMode == ThemeMode.dark) {
                                return Icons.dark_mode;
                              }
                              if (widget.generalLibFlutterApp.themeMode == ThemeMode.light) {
                                return Icons.light_mode;
                              }

                              return Icons.auto_mode;
                            }(),
                            shadows: [
                              BoxShadow(
                                color: context.theme.shadowColor.withAlpha(110),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ];
                  if (context.navigator().canPop()) {
                    children.insert(
                      0,
                      IconButton(
                        onPressed: () {
                          context.navigator().pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          shadows: [
                            BoxShadow(
                              color: context.theme.shadowColor.withAlpha(110),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: children);
                },
              ),
            ],
          ),
        ),
      ),
      body: scroll_controller_auto__keep_state_data.build(
        child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              controller: scroll_controller_auto__keep_state_data.scroll_controller,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: context.height,
                  minWidth: context.width,
                  maxHeight: double.maxFinite,
                  // maxWidth: context.width,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox.fromSize(
                      size: globalKey.sizeRenderBox(),
                    ),
                    //
                    //

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: "${widget.blogHomeData.logo}".trim().isNotEmpty,
                            child: Image.asset(
                              "${widget.blogHomeData.logo}",
                            ),
                          ),
                          Text(
                            "${widget.blogHomeData.title}".trim(),
                            style: TextStyle(
                              color: context.theme.indicatorColor,
                              fontSize: 30,
                              shadows: [
                                BoxShadow(
                                  color: context.theme.shadowColor.withAlpha(110),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget.blogHomeData.description}".trim(),
                            style: TextStyle(
                              color: context.theme.indicatorColor,
                              shadows: [
                                BoxShadow(
                                  color: context.theme.shadowColor.withAlpha(110),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),

                          //
                          AuthorBlogWidget(
                            authorUrlSocialMedias: widget.blogHomeData.author_url_social_medias,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Blogs",
                            style: TextStyle(
                              color: context.theme.indicatorColor,
                              fontSize: 30,
                              shadows: [
                                BoxShadow(
                                  color: context.theme.shadowColor.withAlpha(110),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    () {
                      final List<BlogsData> blogsDatas = widget.blogsDatas.take((Dart.isMobile) ? 10 : 20).toList();
                      return MediaQuery.removePadding(
                        context: context,
                        removeBottom: true,
                        removeLeft: true,
                        removeRight: true,
                        removeTop: true,
                        child: Wrap(
                          // spacing: 3,
                          // runSpacing: 3,
                          direction: (context.mediaQueryData.orientation.isPortrait) ? Axis.vertical : Axis.horizontal,
                          alignment: WrapAlignment.start,
                          children: blogsDatas.map((e) {
                            final Size size = Size(
                              ((context.mediaQueryData.orientation.isPortrait) ? context.width : context.width / 2.5) - 20,
                              (context.height / 2) - 20,
                            );
                            return Container(
                              width: size.width,
                              height: size.height,
                              // margin: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              // decoration: BoxDecoration(
                              //   border: Border.all(
                              //     color: context.theme.indicatorColor,
                              //   ),
                              // ),
                              // padding: EdgeInsets.all(5),
                              child: MediaQuery(
                                data: context.mediaQueryData.copyWith(
                                  size: size,
                                ),
                                child: Builder(
                                  builder: (context) {
                                    return BlogContainerWidget(
                                      blogsData: e,
                                      onTap: () {
                                        handleFunction(
                                          onFunction: (context, statefulWidget) async {
                                            context.navigator().push(MaterialPageRoute(
                                              builder: (context) {
                                                return BlogPageBlog(
                                                  blogsData: e,
                                                  authorUrlSocialMedias: widget.blogHomeData.author_url_social_medias,
                                                  blogFooterData: widget.blogHomeData.footer,
                                                  generalLibFlutterApp: widget.generalLibFlutterApp,
                                                );
                                              },
                                            ));
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                            
                          }).toList(),
                        ),
                      );
                    }(),
                    FooterBlogWidget(
                      authorUrlSocialMedias: widget.blogHomeData.author_url_social_medias,
                      blogFooterData: widget.blogHomeData.footer,
                    ),
                    SizedBox(
                      height: context.mediaQueryData.padding.bottom,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
