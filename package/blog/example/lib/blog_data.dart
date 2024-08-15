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
import 'package:blog/scheme/scheme.dart';

BlogHomeData get blogHomeData => BlogHomeData.create(
      title: "Example Blog",
      logo: "",
      description: """
Example Adalah sebuah library yang memungkinkan anda membuat project dengan cepat
""", 
      author_url_social_medias: {
        "https://youtube.com/@azkadev",
        "https://github.com/azkadev",
        "https://t.me/azkadev",
        "https://instagram.com/azka.developer",
        "https://twitter.com/azka_dev",
        "https://azkadev.netlify.app",
        // "https://tiktok.com/azkadev",
      }.toList(),
      footer: BlogFooterData.create(
        footers: [
          FootersData.create(
            title: "Other Information",
            footer: [
              FooterData.create(
                title: "About",
              ),
              FooterData.create(title: "Buy My Services On Telegram 🥺", url: "https://t.me/azkadevbot?start=ref_web_blog"),
              FooterData.create(title: "Donate Me 🥺", url: "https://github.com/sponsor/azkadev"),
              FooterData.create(title: "Donate Me On Telegram 🥺", url: "https://t.me/azkadevbot?start=donate_web_blog"),
            ],
          ),
          FootersData.create(
            title: "Other Library",
            footer: [
              FooterData.create(title: "Discord Client", url: "https://t.me/azkadevbot?start=ref_web_blog"),
              FooterData.create(title: "DoodStream Client", url: "https://t.me/azkadevbot?start=ref_web_blog"),
              FooterData.create(title: "Github Client", url: "https://t.me/azkadevbot?start=ref_web_blog"),
              FooterData.create(title: "Google Client", url: "https://t.me/azkadevbot?start=ref_web_blog"),
              FooterData.create(title: "Whatsapp Client", url: "https://t.me/azkadevbot?start=ref_web_blog"),
            ],
          ),
        ],
      ), 
    );
