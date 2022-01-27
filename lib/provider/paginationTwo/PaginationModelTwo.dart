// To parse this JSON data, do
//
//     final paginationModelTwo = paginationModelTwoFromJson(jsonString);

import 'dart:convert';

List<PaginationModelTwo> paginationModelTwoFromJson(String str) =>
    List<PaginationModelTwo>.from(
        json.decode(str).map((x) => PaginationModelTwo.fromJson(x)));

String paginationModelTwoToJson(List<PaginationModelTwo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaginationModelTwo {
  PaginationModelTwo({
    this.id,
    this.date,
    this.slug,
    this.type,
    this.link,
    this.title,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.jetpackFeaturedMediaUrl,
    this.shortlink,
    this.rapidData,
    this.premiumContent,
    this.premiumCutoffPercent,
    this.featured,
    this.subtitle,
    this.seoTitle,
    this.editorialContentProvider,
    this.seoDescription,
    this.tcCbMapping,
    this.associatedEvent,
    this.event,
    this.authors,
    this.hideFeaturedImage,
    this.canonicalUrl,
    this.links,
  });

  int? id;
  DateTime? date;
  String? slug;
  Type? type;
  String? link;
  Title? title;
  Excerpt? excerpt;
  int? author;
  int? featuredMedia;
  String? jetpackFeaturedMediaUrl;
  String? shortlink;
  RapidData? rapidData;
  bool? premiumContent;
  int? premiumCutoffPercent;
  bool? featured;
  String? subtitle;
  SeoTitle? seoTitle;
  String? editorialContentProvider;
  String? seoDescription;
  List<dynamic>? tcCbMapping;
  String? associatedEvent;
  String? event;
  List<int>? authors;
  bool? hideFeaturedImage;
  String? canonicalUrl;
  Links? links;

  factory PaginationModelTwo.fromJson(Map<String, dynamic> json) =>
      PaginationModelTwo(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        slug: json["slug"],
        type: typeValues.map![json["type"]],
        link: json["link"],
        title: Title.fromJson(json["title"]),
        excerpt: Excerpt.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        jetpackFeaturedMediaUrl: json["jetpack_featured_media_url"],
        shortlink: json["shortlink"],
        rapidData: RapidData.fromJson(json["rapidData"]),
        premiumContent: json["premiumContent"],
        premiumCutoffPercent: json["premiumCutoffPercent"],
        featured: json["featured"],
        subtitle: json["subtitle"],
        seoTitle: seoTitleValues.map![json["seoTitle"]],
        editorialContentProvider: json["editorialContentProvider"],
        seoDescription: json["seoDescription"],
        tcCbMapping: List<dynamic>.from(json["tc_cb_mapping"].map((x) => x)),
        associatedEvent: json["associatedEvent"],
        event: json["event"],
        authors: List<int>.from(json["authors"].map((x) => x)),
        hideFeaturedImage: json["hide_featured_image"],
        canonicalUrl: json["canonical_url"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date!,
        "slug": slug,
        "type": typeValues.reverse![type],
        "link": link,
        "title": title!.toJson(),
        "excerpt": excerpt!.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "jetpack_featured_media_url": jetpackFeaturedMediaUrl,
        "shortlink": shortlink,
        "rapidData": rapidData!.toJson(),
        "premiumContent": premiumContent,
        "premiumCutoffPercent": premiumCutoffPercent,
        "featured": featured,
        "subtitle": subtitle,
        "seoTitle": seoTitleValues.reverse![seoTitle],
        "editorialContentProvider": editorialContentProvider,
        "seoDescription": seoDescription,
        "tc_cb_mapping": List<dynamic>.from(tcCbMapping!.map((x) => x)),
        "associatedEvent": associatedEvent,
        "event": event,
        "authors": List<dynamic>.from(authors!.map((x) => x)),
        "hide_featured_image": hideFeaturedImage,
        "canonical_url": canonicalUrl,
        "_links": links!.toJson(),
      };
}

class Excerpt {
  Excerpt({
    this.rendered,
    this.protected,
  });

  String? rendered;
  bool? protected;

  factory Excerpt.fromJson(Map<String, dynamic> json) => Excerpt(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.replies,
    this.versionHistory,
    this.predecessorVersion,
    this.authors,
    this.httpsTechcrunchComEdit,
    this.author,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<Author>? replies;
  List<VersionHistory>? versionHistory;
  List<PredecessorVersion>? predecessorVersion;
  List<Author>? authors;
  List<About>? httpsTechcrunchComEdit;
  List<Author>? author;
  List<Author>? wpFeaturedmedia;
  List<About>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Cury>? curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        replies:
            List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(
            json["version-history"].map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: List<PredecessorVersion>.from(
            json["predecessor-version"]
                .map((x) => PredecessorVersion.fromJson(x))),
        authors:
            List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        httpsTechcrunchComEdit: List<About>.from(
            json["https://techcrunch.com/edit"].map((x) => About.fromJson(x))),
        author:
            List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        wpFeaturedmedia: List<Author>.from(
            json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
        wpAttachment: List<About>.from(
            json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm:
            List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": List<dynamic>.from(about!.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
        "version-history":
            List<dynamic>.from(versionHistory!.map((x) => x.toJson())),
        "predecessor-version":
            List<dynamic>.from(predecessorVersion!.map((x) => x.toJson())),
        "authors": List<dynamic>.from(authors!.map((x) => x.toJson())),
        "https://techcrunch.com/edit":
            List<dynamic>.from(httpsTechcrunchComEdit!.map((x) => x.toJson())),
        "author": List<dynamic>.from(author!.map((x) => x.toJson())),
        "wp:featuredmedia":
            List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toJson())),
        "wp:attachment":
            List<dynamic>.from(wpAttachment!.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm!.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies!.map((x) => x.toJson())),
      };
}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  Name? name;
  Href? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: nameValues.map![json["name"]],
        href: hrefValues.map![json["href"]],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse![name],
        "href": hrefValues.reverse![href],
        "templated": templated,
      };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues =
    EnumValues({"https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL});

enum Name { WP }

final nameValues = EnumValues({"wp": Name.WP});

class PredecessorVersion {
  PredecessorVersion({
    this.id,
    this.href,
  });

  int? id;
  String? href;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) =>
      PredecessorVersion(
        id: json["id"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
      };
}

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
  });

  int? count;
  String? href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
      };
}

class WpTerm {
  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  Taxonomy? taxonomy;
  bool? embeddable;
  String? href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: taxonomyValues.map![json["taxonomy"]],
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomyValues.reverse![taxonomy],
        "embeddable": embeddable,
        "href": href,
      };
}

enum Taxonomy {
  CATEGORY,
  POST_TAG,
  TC_CB_TAG_TAXONOMY,
  TC_STORIES_TAX,
  TC_EC_CATEGORY,
  TC_EVENT
}

final taxonomyValues = EnumValues({
  "category": Taxonomy.CATEGORY,
  "post_tag": Taxonomy.POST_TAG,
  "_tc_cb_tag_taxonomy": Taxonomy.TC_CB_TAG_TAXONOMY,
  "tc_ec_category": Taxonomy.TC_EC_CATEGORY,
  "tc_event": Taxonomy.TC_EVENT,
  "tc_stories_tax": Taxonomy.TC_STORIES_TAX
});

class RapidData {
  RapidData({
    this.pt,
    this.pct,
  });

  String? pt;
  String? pct;

  factory RapidData.fromJson(Map<String, dynamic> json) => RapidData(
        pt: json["pt"],
        pct: json["pct"],
      );

  Map<String, dynamic> toJson() => {
        "pt": pt,
        "pct": pct,
      };
}

enum SeoTitle {
  EMPTY,
  BERLIN_S_MAYD_GRABS_34_M_FOR_FAST_PHARMACY_DELIVERY,
  FAN_CRAZE_LAUNCHES_CRICKET_NF_TS_IN_PARTNERSHIP_WITH_ICC
}

final seoTitleValues = EnumValues({
  "Berlin's Mayd grabs \u002434M for fast pharmacy delivery":
      SeoTitle.BERLIN_S_MAYD_GRABS_34_M_FOR_FAST_PHARMACY_DELIVERY,
  "": SeoTitle.EMPTY,
  "FanCraze launches cricket NFTs in partnership with ICC":
      SeoTitle.FAN_CRAZE_LAUNCHES_CRICKET_NF_TS_IN_PARTNERSHIP_WITH_ICC
});

class Title {
  Title({
    this.rendered,
  });

  String? rendered;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

enum Type { POST }

final typeValues = EnumValues({"post": Type.POST});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
