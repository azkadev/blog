// ignore_for_file: unnecessary_brace_in_string_interps

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

import "dart:io";

import "package:general_lib/general_lib.dart";
import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;
import "package:yaml/yaml.dart" as yaml;
import "package:yaml_writer/yaml_writer.dart";

String version_package = "0.0.2";
Future<void> pubspecUpdate({
  required File filePubspec,
  required List<String> librarys,
}) async {
  if (filePubspec.existsSync()) {
    Map yaml_code = (yaml.loadYaml(filePubspec.readAsStringSync(), recover: true) as Map);
    Map yaml_code_clone = yaml_code.clone();

    yaml_code_clone.addAll({
      "description": "A Library for create blog super easy and fast customizable",
      "version": version_package,
      "repository": "https://github.com/azkadev/blog",
      "homepage": "https://github.com/azkadev/blog",
      "issue_tracker": "https://github.com/azkadev/blog/issues",
      "blog": "https://github.com/azkadev/blog/tree/main/docs",
      "funding": [
        "https://github.com/sponsors/azkadev",
      ],
      "platforms": {
        "android": null,
        "ios": null,
        "linux": null,
        "macos": null,
        "web": null,
        "windows": null,
      },
    });

    yaml_code_clone.removeByKeys([
      "publish_to",
    ]);
    if (yaml_code_clone["dependencies"] is Map) {
      (yaml_code_clone["dependencies"] as Map).forEach((key, value) {
        if (librarys.contains(key)) {
          yaml_code_clone["dependencies"][key] = "^${version_package}";
        }
      });
      (yaml_code_clone["dependencies"] as Map).forEach((key, value) {
        if (key == "general_lib") {
          yaml_code_clone["dependencies"][key] = "^0.0.36";
        }
        if (key == "general_lib_flutter") {
          yaml_code_clone["dependencies"][key] = "^0.0.19";
        }
      });
    }
    var yamlDoc = YamlWriter().write(yaml_code_clone);

    await filePubspec.writeAsString(yamlDoc);
  }
}

void main(List<String> args) async {
  Directory directory = Directory.current;
  Directory directory_home = Directory(path.join(directory.path));

  File file_pubspec_home = File(path.join(directory_home.path, "pubspec.yaml"));
  await pubspecUpdate(filePubspec: file_pubspec_home, librarys: []);
  Directory directory_packages = Directory(path.join(directory.path, "package"));

  if (!directory_packages.existsSync()) {
    print("Directory Packages Not Found: ${directory_packages.path}");
    exit(1);
  }

  List<FileSystemEntity> file_system_entity_packages = directory_packages.listSync();

  List<String> librarys = file_system_entity_packages.map((e) => path.basename(e.path)).toList();

  for (var i = 0; i < file_system_entity_packages.length; i++) {
    FileSystemEntity fileSystemEntity = file_system_entity_packages[i];
    if (fileSystemEntity is Directory) {
      File file_changelog = File(path.join(fileSystemEntity.path, "CHANGELOG.md"));
      await file_changelog.writeAsString("""
## ${version_package}

- Update Topics.
""");
      File file_pubspec = File(path.join(fileSystemEntity.path, "pubspec.yaml"));

      await pubspecUpdate(filePubspec: file_pubspec, librarys: librarys);
    }
  }

  print("Finished");
}