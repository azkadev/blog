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
// ignore_for_file: implementation_imports, duplicate_ignore, use_build_context_synchronously, unnecessary_brace_in_string_interps, empty_catches

import 'package:cool_alert/cool_alert.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:markdown_flutter/markdown_flutter.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'package:markdown_flutter/src/custom_text_node.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'images_node.dart';
// import 'package:gmss_app/widget/widget.dart';

class MarkdownBlogWidget extends StatelessWidget {
  final Future<String> Function() text;
  final EdgeInsets? padding;
  final Alignment alignment;
  const MarkdownBlogWidget({
    super.key,
    this.padding,
    required this.alignment,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: text(),
      builder: (context, snapshot) {
        if (snapshot.data is String) {
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            removeLeft: true,
            removeRight: true,
            child: MarkdownFlutterWidget(
              data: snapshot.data!.trim(),
              shrinkWrap: true,
              padding: padding,
              markdownGeneratorConfig: MarkdownGenerator(
                generators: [
                  mediaGeneratorWithTag,
                  // videoGeneratorWithTag,
                  SpanNodeGeneratorWithTag(
                    // <text data="https://www.youtube.com/watch?v=HjgD6ZhSFIA">
                    tag: "text",

                    generator: (e, config, visitor) {
                      return MarkdownTextCustomNode(
                        attribute: e.attributes,
                      );
                    },
                  ),
                  SpanNodeGeneratorWithTag(
                    // <video src="https://www.youtube.com/watch?v=HjgD6ZhSFIA">
                    tag: "callback_data",

                    generator: (e, config, visitor) {
                      return MarkdownTextNode(
                        attribute: e.attributes,
                      );
                    },
                  ),
                ],
                textGenerator: (node, config, visitor) {
                  return CustomTextNode(
                    node.textContent,
                    config,
                    visitor,
                  );
                },
              ),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class MarkdownTextNode extends SpanNode {
  final Map<String, String> attribute;
  // final GeneralClientFlutter generalClientFlutter;

  MarkdownTextNode({
    required this.attribute,
    // required this.generalClientFlutter,
  });

  @override
  InlineSpan build() {
    String text = attribute["text"] ?? '';
    String data = attribute["data"] ?? "";

    return WidgetSpan(
      child: CallbackDataWidget(
        text: text,
        data: data,
      ),
    );
  }
}

class CallbackDataWidget extends StatefulWidget {
  final String text;
  final String data;
  const CallbackDataWidget({
    super.key,
    required this.text,
    required this.data,
  });

  @override
  State<CallbackDataWidget> createState() => _CallbackDataWidgetState();
}

class _CallbackDataWidgetState extends State<CallbackDataWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: Text(
        widget.text,
        style: TextStyle(
          color: Colors.blue,
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
}

class MarkdownTextCustomNode extends SpanNode {
  final Map<String, String> attribute;
  // final GeneralClientFlutter generalClientFlutter;

  MarkdownTextCustomNode({
    required this.attribute,
    // required this.generalClientFlutter,
  });

  @override
  InlineSpan build() {
    return WidgetSpan(
      child: MarkdownTextNodeCustomWidget(
        attribute: attribute,
        // generalClientFlutter: generalClientFlutter,
      ),
    );
  }
}

class MarkdownTextNodeCustomWidget extends StatefulWidget {
  final Map<String, String> attribute;
  const MarkdownTextNodeCustomWidget({
    super.key,
    required this.attribute,
    // required super.generalClientFlutter,
  });

  @override
  State<MarkdownTextNodeCustomWidget> createState() => _MarkdownTextNodeCustomWidgetState();
}

class _MarkdownTextNodeCustomWidgetState extends State<MarkdownTextNodeCustomWidget> {
  @override
  Widget build(BuildContext context) {
    String url = () {
      if (widget.attribute["url"] is String && (widget.attribute["url"] as String).isNotEmpty) {
        return (widget.attribute["url"] as String);
      }
      return "";
    }();
    double? fontSize = () {
      try {
        double sizeFont = (int.tryParse(widget.attribute["size"] ?? "0") ?? 0).toDouble();
        if (sizeFont > 0) {
          return sizeFont;
        }
      } catch (e) {}
      return null;
    }();

    // if (fontSize)
    Widget child = () {
      Widget child = EasyRichText(
        "${widget.attribute["data"]}".trim(),
        patternList: const [],
        defaultStyle: TextStyle(
          // fontFamily: "NotoEmoji",
          
          color: (url.isNotEmpty) ? Colors.blue : null,
          fontSize: fontSize,
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

      if (url.isNotEmpty) {
        return InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            CoolAlert.show(
              context: context,
              type: CoolAlertType.info,
              title: """
Apakah anda yakin?
"""
                  .trim(),
              text: "Open: ${url}".trim(),
              onConfirmBtnTap: () async {
                await launchUrlString(url, mode: LaunchMode.externalApplication
                    // webViewConfiguration: WebViewConfiguration(
                    //   headers: {
                    //     "Refferer": "app"
                    //   },
                    // ),
                    );
              },
            );
          },
          child: child,
        );
      }
      return child;
    }();
    if (widget.attribute["is_center"] == "true") {
      return Center(
        child: child,
      );
    }

    return child;
  }
}
