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
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      refresh();
    });
  }

  Future<void> refresh() async {
    setState(() {});

    bool is_succes = await Future(() async {
      try {
        setState(() {});
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
    setState(() {});
  }

  String navigate_content_id = "";

  String content = "";

  @override
  void dispose() {
    navigate_content_id = "";
    content = "";
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
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    "${widget.blogsData.title}".trim(),
                    style: TextStyle(
                      color: context.theme.indicatorColor,
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
                            if (widget.generalLibFlutterApp.themeMode ==
                                ThemeMode.dark) {
                              return Icons.dark_mode;
                            }
                            if (widget.generalLibFlutterApp.themeMode ==
                                ThemeMode.light) {
                              return Icons.light_mode;
                            }

                            return Icons.auto_mode;
                          }(),
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
      body: ConstrainedBox(
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
            bodyContent(),
          ],
        ),
      ),
    );
  }

  Widget bodySideBar() {
    return const SizedBox.shrink();
  }

  Widget bodyContent() {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.height - globalKey.sizeRenderBox().height,
          minWidth: context.width,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: MarkdownBlogWidget(
                alignment: Alignment.center,
                text: () async {
                  return content.trim();
                },
              ),
            ),
            FooterBlogWidget(
              authorUrlSocialMedias: widget.authorUrlSocialMedias,
              blogFooterData: widget.blogFooterData,
            ),
          ],
        ),
      ),
    );
  }
}
