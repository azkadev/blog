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
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:blog/scheme/scheme.dart';
import 'package:blog/widget/footer.dart';
import 'package:blog/widget/markdown/markdown.dart';
import 'package:icons_plus/icons_plus.dart';

class BlogPageBlog extends StatefulWidget {
  final BlogsData blogsData;
  final List<String> authorUrlSocialMedias;
  final BlogFooterData blogFooterData;
  final GeneralLibFlutterApp generalLibFlutterApp;
  const BlogPageBlog({
    super.key,
    required this.blogsData,
    required this.authorUrlSocialMedias,
    required this.blogFooterData,
    required this.generalLibFlutterApp,
  });

  @override
  State<BlogPageBlog> createState() => _BlogPageBlogState();
}

class _BlogPageBlogState extends State<BlogPageBlog> {
  GlobalKey globalKey = GlobalKey();

  ScrollControllerAutoKeepStateData scroll_controller_auto__keep_state_data = ScrollControllerAutoKeepStateData(keyId: "blog_page");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      refresh();
    });
  }

  List<BlogContents> contents = [];
  int getIndex({
    required String contentId,
  }) {
    return contents.indexWhere((e) => e.content_id == contentId);
  }

  Future<void> refresh() async {
    setState(() {});

    bool is_succes = await Future(() async {
      try {
        setState(() {
          contents = widget.blogsData.contents;
        });
        setContent(contentId: contents.first.content_id ?? "");
        return true;
      } catch (e) {
        context.navigator().pop();
        return false;
      }
    });

    if (is_succes) {
      setState(() {});
    }
  }

  void setContent({
    required String contentId,
  }) {
    navigate_content_id = contentId;
    setState(() {});
    content = contents.firstWhere((element) => element.content_id == navigate_content_id).content ?? "";
    setState(() {});
  }

  void setContentByIndex({
    required int indexContent,
  }) {
    setState(() {});
    BlogContents blogContents = contents[indexContent];
    navigate_content_id = blogContents.content_id ?? "";
    content = blogContents.content ?? "";
    scroll_controller_auto__keep_state_data.scroll_controller.position.restoreOffset(0);
    setState(() {});
  }

  String navigate_content_id = "";

  String content = "";

  @override
  void dispose() {
    navigate_content_id = "";
    content = "";
    scroll_controller_auto__keep_state_data.dispose();
    // TODO: implement dispose
    super.dispose();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  Text(
                    "${widget.blogsData.title}".trim(),
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
                ],
              ),
            ],
          ),
        ),
      ),
      body: () {
        if (context.orientation.isPortrait) {
          return bodyContent();
        }
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: context.height,
            minWidth: context.width,
            maxHeight: context.height,
            maxWidth: context.width,
          ),
          child: Column(
            children: [
              SizedBox.fromSize(
                size: globalKey.sizeRenderBox(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: bodyContent(),
                    ),
                    // VerticalDivider(
                    //   color: context.theme.cardColor,
                    // ),
                    Expanded(
                      flex: 1,
                      child: bodySideBar(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }(),
    );
  }

  Widget bodySideBar() {
    List<Widget> children = [];

    // for (var element in widget.blogsData.sidebars) {
    //    children.add(
    //     TextButton(
    //       onPressed: () async {
    //         setContent(contentId: element.navigate_content_id ?? "");
    //       },
    //       child: Text(
    //         "${element.title}",
    //         style: TextStyle(
    //           color: (element.navigate_content_id == navigate_content_id) ? context.theme.indicatorColor : context.theme.cardColor,
    //           fontSize: 15,
    //           shadows: [
    //             BoxShadow(
    //               color: context.theme.shadowColor.withAlpha(110),
    //               spreadRadius: 1,
    //               blurRadius: 7,
    //               offset: const Offset(0, 3), // changes position of shadow
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.height - globalKey.sizeRenderBox().height,
          minWidth: context.width,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget bodyContent() {
    return scroll_controller_auto__keep_state_data.build(
      child: Builder(
        builder: (context) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            controller: scroll_controller_auto__keep_state_data.scroll_controller,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: context.height - globalKey.sizeRenderBox().height,
                minWidth: context.width,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (context.orientation.isPortrait) ...[
                    SizedBox(
                      height: globalKey.sizeRenderBox().height,
                    ),
                  ],
                  // () {
                  //   final Size size = Size(
                  //     (context.width),
                  //     (context.height / 1.5) - 20,
                  //   );
                  //   return Container(
                  //     width: size.width,
                  //     height: size.height,
                  //     // margin: const EdgeInsets.all(10),
                  //     alignment: Alignment.center,
                  //     // decoration: BoxDecoration(
                  //     //   border: Border.all(
                  //     //     color: context.theme.indicatorColor,
                  //     //   ),
                  //     // ),
                  //     // padding: EdgeInsets.all(5),
                  //     child: MediaQuery(
                  //       data: context.mediaQueryData.copyWith(
                  //         size: size,
                  //       ),
                  //       child: Builder(
                  //         builder: (context) {
                  //           return BlogContainerWidget(
                  //             blogsData: widget.blogsData,
                  //             onTap: () {},
                  //           );
                  //         },
                  //       ),
                  //     ),
                  //   );
                  // }(),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: MarkdownBlogWidget(
                      alignment: Alignment.center,
                      text: () async {
                        return content.trim();
                      },
                    ),
                  ),
                  if (contents.length > 1) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: () {
                        final List<Widget> children = [];
                        final int total_length = contents.length;
                        final int index = getIndex(contentId: navigate_content_id);
                        if ((index - 1) > -1) {
                          children.add(IconButton(
                            onPressed: () {
                              setContentByIndex(indexContent: index - 1);
                            },
                            icon: const RotatedBox(
                              quarterTurns: 2,
                              child: Icon(Iconsax.send_1_outline),
                            ),
                          ));
                        }
                        if ((index + 1) < total_length) {
                          children.add(IconButton(
                            onPressed: () {
                              setContentByIndex(indexContent: index + 1);
                            },
                            icon: const Icon(Iconsax.send_1_outline),
                          ));
                        }
                        return children;
                      }(),
                    ),
                  ],
                  FooterBlogWidget(
                    authorUrlSocialMedias: widget.authorUrlSocialMedias,
                    blogFooterData: widget.blogFooterData,
                  ),
                  if (context.orientation.isPortrait) ...[
                    SizedBox(
                      height: context.mediaQueryData.padding.bottom,
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
