// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "blog_footer_data.dart";

 
class BlogHomeData extends JsonScheme {

  
  BlogHomeData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"blogHomeData","logo":"","title":"","description":"","author_url_social_medias":["url"],"footer":{"@type":"blogFooterData","footers":[{"@type":"footersData","title":"","footer":[{"@type":"footerData","text":"","url":""}]}]}};
  }

  
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set special_type(String? value) {
    rawData["@type"] = value;
  }


  
  String? get logo {
    try {
      if (rawData["logo"] is String == false){
        return null;
      }
      return rawData["logo"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set logo(String? value) {
    rawData["logo"] = value;
  }


  
  String? get title {
    try {
      if (rawData["title"] is String == false){
        return null;
      }
      return rawData["title"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set title(String? value) {
    rawData["title"] = value;
  }


  
  String? get description {
    try {
      if (rawData["description"] is String == false){
        return null;
      }
      return rawData["description"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set description(String? value) {
    rawData["description"] = value;
  }


  
  List<String> get author_url_social_medias {
    try {
      if (rawData["author_url_social_medias"] is List == false){
        return [];
      }
      return (rawData["author_url_social_medias"] as List).cast<String>();
    } catch (e) {
      return [];
    }
  }


  
  set author_url_social_medias(List<String> value) {
    rawData["author_url_social_medias"] = value;
  }


  
  BlogFooterData get footer {
    try {
      if (rawData["footer"] is Map == false){
        return BlogFooterData({}); 
      }
      return BlogFooterData(rawData["footer"] as Map);
    } catch (e) {  
      return BlogFooterData({}); 
    }
  }


  
  set footer(BlogFooterData value) {
    rawData["footer"] = value.toJson();
  }



  
  static BlogHomeData create({

    String special_type = "blogHomeData",
    String? logo,
    String? title,
    String? description,
      List<String>? author_url_social_medias,
      BlogFooterData? footer,
})  {
    // BlogHomeData blogHomeData = BlogHomeData({
Map blogHomeData_data_create_json = {
  
      "@type": special_type,
      "logo": logo,
      "title": title,
      "description": description,
      "author_url_social_medias": author_url_social_medias,
      "footer": (footer != null)?footer.toJson(): null,


};


          blogHomeData_data_create_json.removeWhere((key, value) => value == null);
BlogHomeData blogHomeData_data_create = BlogHomeData(blogHomeData_data_create_json);

return blogHomeData_data_create;



      }
}