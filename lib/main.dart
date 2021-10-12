import 'dart:convert';
// import 'dart:js';

import 'package:appbesaz/modules/AparatModule/aparatModule.dart';
import 'package:appbesaz/modules/AboutusModule/aboutusModule.dart';
import 'package:appbesaz/widgets/cardWidget.dart';
import 'package:appbesaz/widgets/iconlinkWidget.dart';
import 'package:flutter/material.dart';
import 'package:appbesaz/modules/ListModule/listModule.dart';
import 'package:appbesaz/modules/ListModule/listTileModule.dart';
import 'package:appbesaz/modules/module.dart';
import 'package:appbesaz/modules/siteModule.dart';
import 'package:flutter/services.dart';
import 'modules/callModule.dart';
import 'package:appbesaz/modules/settingsModule.dart';

import 'modules/contentModule.dart';

String s = '{"videobyuser":[{"id":"38003008","title":"\u062c\u062f\u06cc\u062f\u062a\u0631\u06cc\u0646 \u0631\u0627\u0647\u0646\u0645\u0627\u06cc \u062e\u0631\u06cc\u062f \u0644\u067e\u062a\u0627\u067e \u062f\u0627\u0646\u0634\u062c\u0648\u06cc\u06cc","username":"Binoshacast","userid":"5314153","visit_cnt":453,"uid":"rwSWq","isHidden":false,"process":"done","sender_name":"\u0628\u06cc\u0646\u0648\u0634\u0627","big_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/38003008-5278-b__4887.jpg","small_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/38003008-5278__4887.jpg","profilePhoto":"https:\/\/www.aparat.com\/public\/public\/user_data\/profile_photo\/1772\/5314153-m.jpg","duration":914,"sdate":"4 \u0645\u0647\u0631 1400","create_date":"2021-09-26 19:25:24","sdate_timediff":100155,"frame":"https:\/\/www.aparat.com\/video\/video\/embed\/videohash\/rwSWq\/vt\/frame","official":"yes","autoplay":true,"video_date_status":"notset","360d":false,"deleteurl":""},{"id":"37909513","title":"\u0646\u06af\u0627\u0647 \u0646\u0632\u062f\u06cc\u06a9 \u0628\u0647 \u0633\u0631\u0641\u06cc\u0633 \u0647\u0627\u06cc \u062c\u062f\u06cc\u062f \u0645\u0627\u06cc\u06a9\u0631\u0648\u0633\u0627\u0641\u062a \u0648 \u06a9\u0646\u0641\u0631\u0627\u0646\u0633 \u0645\u0639\u0631\u0641\u06cc \u0648\u06cc\u0646\u062f\u0648\u0632 \u06f1\u06f1 \u0648 \u0633\u0631\u0641\u0633 \u06f2\u06f0\u06f2\u06f1","username":"Binoshacast","userid":"5314153","visit_cnt":7149,"uid":"qBXf5","isHidden":false,"process":"done","sender_name":"\u0628\u06cc\u0646\u0648\u0634\u0627","big_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/37909513-9000-b__9188.jpg","small_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/37909513-9000__9188.jpg","profilePhoto":"https:\/\/www.aparat.com\/public\/public\/user_data\/profile_photo\/1772\/5314153-m.jpg","duration":764,"sdate":"1 \u0645\u0647\u0631 1400","create_date":"2021-09-23 19:04:47","sdate_timediff":360592,"frame":"https:\/\/www.aparat.com\/video\/video\/embed\/videohash\/qBXf5\/vt\/frame","official":"yes","autoplay":true,"video_date_status":"notset","360d":false,"deleteurl":""},{"id":"37879703","title":"\u0628\u0631\u0631\u0633\u06cc \u0645\u062a\u0641\u0627\u0648\u062a \u062e\u0627\u0635 \u062a\u0631\u06cc\u0646 \u06af\u0648\u0634\u06cc \u0633\u0627\u0645\u0633\u0648\u0646\u06af  \u06af\u0644\u06a9\u0633\u06cc \u0632\u062f \u0641\u0648\u0644\u062f \u06f3 | Samsung Galaxy Z Fold 3","username":"Binoshacast","userid":"5314153","visit_cnt":1065,"uid":"wEYRH","isHidden":false,"process":"done","sender_name":"\u0628\u06cc\u0646\u0648\u0634\u0627","big_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/37879703-5980-b__1598.jpg","small_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/37879703-5980__1598.jpg","profilePhoto":"https:\/\/www.aparat.com\/public\/public\/user_data\/profile_photo\/1772\/5314153-m.jpg","duration":1030,"sdate":"31 \u0634\u0647\u0631\u06cc\u0648\u0631 1400","create_date":"2021-09-22 19:06:33","sdate_timediff":446886,"frame":"https:\/\/www.aparat.com\/video\/video\/embed\/videohash\/wEYRH\/vt\/frame","official":"yes","autoplay":true,"video_date_status":"notset","360d":false,"deleteurl":""},{"id":"37808343","title":"\u0622\u0645\u0648\u0632\u0634 \u0628\u0647\u062a\u0631\u06cc\u0646 \u0631\u0648\u0634 \u0646\u0635\u0628 \u0648\u06cc\u0646\u062f\u0648\u0632 \u06f1\u06f1 \u0631\u0648\u06cc \u06a9\u0627\u0645\u067e\u06cc\u0648\u062a\u0631 \u0648 \u0644\u067e \u062a\u0627\u067e","username":"Binoshacast","userid":"5314153","visit_cnt":14101,"uid":"4OgNs","isHidden":false,"process":"done","sender_name":"\u0628\u06cc\u0646\u0648\u0634\u0627","big_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/37808343-7174-b__6403.jpg","small_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/37808343-7174__6403.jpg","profilePhoto":"https:\/\/www.aparat.com\/public\/public\/user_data\/profile_photo\/1772\/5314153-m.jpg","duration":635,"sdate":"29 \u0634\u0647\u0631\u06cc\u0648\u0631 1400","create_date":"2021-09-20 19:09:39","sdate_timediff":623100,"frame":"https:\/\/www.aparat.com\/video\/video\/embed\/videohash\/4OgNs\/vt\/frame","official":"yes","autoplay":true,"video_date_status":"notset","360d":false,"deleteurl":""},{"id":"37734073","title":"\u0628\u0631\u0631\u0633\u06cc \u0644\u062c\u06cc\u0648\u0646 \u06f5 ( \u0628\u0647\u062a\u0631\u06cc\u0646 \u0644\u067e\u062a\u0627\u067e \u06af\u06cc\u0645\u06cc\u0646\u06af) | Lenovo Legion 5 2021 Review","username":"Binoshacast","userid":"5314153","visit_cnt":9934,"uid":"vKczL","isHidden":false,"process":"done","sender_name":"\u0628\u06cc\u0646\u0648\u0634\u0627","big_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/37734073-3508-b__9352.jpg","small_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/37734073-3508__9352.jpg","profilePhoto":"https:\/\/www.aparat.com\/public\/public\/user_data\/profile_photo\/1772\/5314153-m.jpg","duration":1328,"sdate":"27 \u0634\u0647\u0631\u06cc\u0648\u0631 1400","create_date":"2021-09-18 16:53:41","sdate_timediff":804058,"frame":"https:\/\/www.aparat.com\/video\/video\/embed\/videohash\/vKczL\/vt\/frame","official":"yes","autoplay":true,"video_date_status":"notset","360d":false,"deleteurl":""}],"ui":{"pagingForward":"https:\/\/www.aparat.com\/\/etc\/api\/videoByUser\/username\/Binoshacast\/perpage\/5\/curoffset\/5","pagingBack":null}}';
String vla1 = '{"video":{"id":"36982218","title":"\u0633\u0631\u0648\u06cc\u0633 \u062a\u0628\u0644\u06cc\u063a\u0627\u062a \u062f\u0631 \u0622\u067e\u0627\u0631\u0627\u062a\u061b \u0648\u06cc\u062a\u0631\u06cc\u0646\u06cc \u0628\u0647 \u0648\u0633\u0639\u062a \u06f6\u06f0 \u0645\u06cc\u0644\u06cc\u0648\u0646 \u0645\u062e\u0627\u0637\u0628","username":"Digiato","userid":"349868","visit_cnt":2241,"uid":"5zOim","isHidden":false,"process":"done","sender_name":"\u062f\u06cc\u062c\u06cc\u0627\u062a\u0648","big_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/36982218-6510-b__2041.jpg","small_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/36982218-6510__2041.jpg","profilePhoto":"https:\/\/static.cdn.asset.aparat.com\/profile-photo\/349868-6510-m.jpg","duration":209,"sdate":"6 \u0634\u0647\u0631\u06cc\u0648\u0631 1400","create_date":"2021-08-28 13:12:19","sdate_timediff":3148539,"frame":"https:\/\/www.aparat.com\/video\/video\/embed\/videohash\/5zOim\/vt\/frame","official":"no","tags":[{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"5000"},{"name":"\u062a\u0628\u0644\u06cc\u063a\u0627\u062a","cnt":"5000"},{"name":"ads","cnt":"155"},{"name":"aparat","cnt":"1809"},{"name":"\u0622\u067e\u0627\u0631\u062a","cnt":"928"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"5000"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"5000"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"5000"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"5000"},{"name":"aparat","cnt":"1706"},{"name":"\u0622\u067e\u0627\u0631\u062a","cnt":"922"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"5000"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"5000"},{"name":"\u062a\u0628\u0644\u06cc\u063a\u0627\u062a","cnt":"3115"},{"name":"aparat","cnt":"1010"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"4946"},{"name":"\u0648\u06cc\u062f\u06cc\u0648 ","cnt":"4014"},{"name":"\u0648\u06cc\u062f\u06cc\u0648 ","cnt":"3866"},{"name":"\u062a\u0628\u0644\u06cc\u063a\u0627\u062a","cnt":"1382"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"2656"},{"name":"\u0648\u06cc\u062f\u06cc\u0648 ","cnt":"2226"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"2226"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"2226"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"1950"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"1817"},{"name":"\u062a\u0628\u0644\u06cc\u063a\u0627\u062a","cnt":"603"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"1329"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"1074"},{"name":"\u0648\u06cc\u062f\u06cc\u0648","cnt":"912"}],"tag_str":"\u0622\u067e\u0627\u0631\u062a-\u062a\u0628\u0644\u06cc\u063a\u0627\u062a-\u0648\u06cc\u062f\u06cc\u0648-Aparat-Ads","description":"\u0622\u067e\u0627\u0631\u0627\u062a \u0628\u0627 \u062a\u063a\u06cc\u06cc\u0631 \u0648 \u0627\u0635\u0644\u0627\u062d \u0633\u06cc\u0633\u062a\u0645 \u0627\u0641\u0632\u0627\u06cc\u0634 \u0628\u0627\u0632\u062f\u06cc\u062f (Boost) \u062e\u0648\u062f\u060c \u0627\u062e\u06cc\u0631\u0627 \u0627\u0632 \u0633\u0631\u0648\u06cc\u0633 \u062a\u0628\u0644\u06cc\u063a\u0627\u062a \u062c\u062f\u06cc\u062f\u06cc \u0631\u0648\u0646\u0645\u0627\u06cc\u06cc \u06a9\u0631\u062f\u0647 \u0627\u0633\u062a. \u062f\u0631 \u0633\u06cc\u0633\u062a\u0645 \u062c\u062f\u06cc\u062f \u0622\u067e\u0627\u0631\u0627\u062a\u060c \u0647\u0631 \u06a9\u0633 \u0645\u06cc&zwnj;\u062a\u0648\u0627\u0646\u062f \u0628\u0627 \u062d\u062f\u0627\u0642\u0644 \u0628\u0648\u062f\u062c\u0647 500 \u0647\u0632\u0627\u0631 \u062a\u0648\u0645\u0627\u0646 \u062a\u0628\u0644\u06cc\u063a\u0627\u062a \u062e\u0648\u062f \u0631\u0627 \u062f\u0631 \u0622\u067e\u0627\u0631\u0627\u062a \u0628\u0647 \u0645\u0639\u0631\u0636 \u062f\u06cc\u062f \u062c\u0627\u0645\u0639\u0647 \u06a9\u0627\u0631\u0628\u0631\u06cc 60 \u0645\u06cc\u0644\u06cc\u0648\u0646\u06cc \u0627\u06cc\u0646 \u067e\u0644\u062a\u0641\u0631\u0645 \u0628\u06af\u0630\u0627\u0631\u062f.\r\n\u062f\u0631 \u0627\u06cc\u0646 \u0648\u06cc\u062f\u06cc\u0648 \u0628\u0627 \u0633\u0631\u0648\u06cc\u0633 \u062a\u0628\u0644\u06cc\u063a\u0627\u062a \u062c\u062f\u06cc\u062f \u0622\u067e\u0627\u0631\u0627\u062a \u0622\u0634\u0646\u0627 \u0645\u06cc&zwnj;\u0634\u0648\u06cc\u0645.","cat_id":10,"cat_name":"\u0639\u0644\u0645 \u0648 \u062a\u06a9\u0646\u0648\u0644\u0648\u0698\u06cc","cat_name_en":"tech","autoplay":true,"video_date_status":"notset","360d":false,"deleteurl":"","playeradvertcornel":"","has_comment":"yes","has_comment_txt":"","size":"2180686","watch_action":{"type":"watch"},"cost_type":{"type":"free"},"can_download":true,"like_cnt":111,"follow_link":null,"follow_status":null,"ip_address":"178.239.167.175"}}';
String vla2 = '{"video":{"id":"37909513","title":"\u0646\u06af\u0627\u0647 \u0646\u0632\u062f\u06cc\u06a9 \u0628\u0647 \u0633\u0631\u0641\u06cc\u0633 \u0647\u0627\u06cc \u062c\u062f\u06cc\u062f \u0645\u0627\u06cc\u06a9\u0631\u0648\u0633\u0627\u0641\u062a \u0648 \u06a9\u0646\u0641\u0631\u0627\u0646\u0633 \u0645\u0639\u0631\u0641\u06cc \u0648\u06cc\u0646\u062f\u0648\u0632 \u06f1\u06f1 \u0648 \u0633\u0631\u0641\u0633 \u06f2\u06f0\u06f2\u06f1","username":"Binoshacast","userid":"5314153","visit_cnt":7543,"uid":"qBXf5","isHidden":false,"process":"done","sender_name":"\u0628\u06cc\u0646\u0648\u0634\u0627","big_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/37909513-9000-b__9188.jpg","small_poster":"https:\/\/static.cdn.asset.aparat.com\/avt\/37909513-9000__9188.jpg","profilePhoto":"https:\/\/static.cdn.asset.aparat.com\/profile-photo\/5314153-9000-m.jpg","duration":764,"sdate":"1 \u0645\u0647\u0631 1400","create_date":"2021-09-23 19:04:47","sdate_timediff":877056,"frame":"https:\/\/www.aparat.com\/video\/video\/embed\/videohash\/qBXf5\/vt\/frame","official":"yes","tags":[{"name":"surface","cnt":"344"},{"name":"\u0633\u0631\u0641\u06cc\u0633","cnt":"280"},{"name":"\u06a9\u0646\u0641\u0631\u0627\u0646\u0633 \u0645\u0627\u06cc\u06a9\u0631\u0648\u0633\u0627\u0641\u062a","cnt":"12"},{"name":"\u0627\u06cc\u0648\u0646\u062a \u0633\u0631\u0641\u06cc\u0633","cnt":"1"},{"name":"\u0633\u0631\u0641\u06cc\u0633 \u0628\u0648\u06a9 \u0627\u0633\u062a\u0648\u062f\u06cc\u0648","cnt":"1"}],"tag_str":"\u0633\u0631\u0641\u06cc\u0633-\u06a9\u0646\u0641\u0631\u0627\u0646\u0633 \u0645\u0627\u06cc\u06a9\u0631\u0648\u0633\u0627\u0641\u062a-\u0627\u06cc\u0648\u0646\u062a \u0633\u0631\u0641\u06cc\u0633-\u0633\u0631\u0641\u06cc\u0633 \u0628\u0648\u06a9 \u0627\u0633\u062a\u0648\u062f\u06cc\u0648-surface","description":"\u0645\u0627\u06cc\u06a9\u0631\u0648\u0633\u0627\u0641\u062a \u0628\u0639\u062f \u06a9\u0644\u06cc \u0627\u0646\u062a\u0638\u0627\u0631 \u0646\u0633\u062e\u0647 \u062c\u062f\u06cc\u062f \u0648\u06cc\u0646\u062f\u0648\u0632 \u0631\u0648 \u062f\u0631 \u06a9\u0646\u0627\u0631 \u0633\u0631\u06cc \u062c\u062f\u06cc\u062f \u0633\u0631\u0641\u06cc\u0633 \u0645\u0639\u0631\u0641\u06cc \u06a9\u0631\u062f\n\n\n\ufe0f \u062a\u0648 \u0627\u06cc\u0646 \u0628\u0631\u0646\u0627\u0645\u0647 \u0627\u0645\u06cc\u0646 \u0627\u0632 \u06a9\u0646\u0641\u0631\u0627\u0646\u0633 \u0645\u0627\u06cc\u06a9\u0631\u0648\u0633\u0627\u0641\u062a\u060c \u0645\u0639\u0631\u0641\u06cc \u0648\u06cc\u0646\u062f\u0648\u0632 \u06f1\u06f1 \u0648 \u0633\u0631\u0641\u06cc\u0633 \u0647\u0627\u06cc \u062c\u062f\u06cc\u062f \u0645\u06cc\u06af\u0647 \u062a\u0627 \u0628\u0628\u06cc\u0646\u06cc\u0645 \u0648\u0627\u0642\u0639\u0627\u064b \u0645\u0627\u06cc\u06a9\u0631\u0648\u0633\u0627\u0641\u062a \u0627\u0645\u0633\u0627\u0644 \u0639\u0645\u0644\u06a9\u0631\u062f \u0642\u0627\u0628\u0644 \u0642\u0628\u0648\u0644\u06cc \u062f\u0627\u0631\u0647 \u06cc\u0627 \u0646\u0647\u061f!\n\n\ufe0f \u0628\u0631\u0627\u06cc \u062d\u0645\u0627\u06cc\u062a \u0627\u0632 \u0645\u0627 \u0641\u0642\u0637 \u06a9\u0627\u0641\u06cc\u0647 \u06a9\u0627\u0646\u0627\u0644 \u0628\u06cc\u0646\u0648\u0634\u0627 \u0631\u0648 \u0628\u0647 \u062f\u0648\u0633\u062a\u0627\u062a\u0648\u0646 \u06a9\u0647 \u0642\u0635\u062f \u062e\u0631\u06cc\u062f \u06af\u0648\u0634\u06cc \u06cc\u0627 \u0644\u067e\u062a\u0627\u067e \u062f\u0627\u0631\u0646\u062f \u0631\u0648 \u0645\u0639\u0631\u0641\u06cc \u06a9\u0646\u06cc\u062f!\n\n\n\ufe0f \u0627\u0632 \u0627\u06cc\u0646 \u0644\u06cc\u0646\u06a9 \u0647\u0645 \u0645\u06cc\u062a\u0648\u0646\u06cc\u062f \u0627\u0632 \u0628\u06cc\u0646\u0648\u0634\u0627 \u062d\u0645\u0627\u06cc\u062a \u0645\u0627\u0644\u06cc \u06a9\u0646\u06cc\u062f \u062a\u0627 \u0628\u062a\u0648\u0646\u06cc\u0645 \u0628\u0627 \u06af\u062c\u062a \u0647\u0627\u06cc \u062c\u062f\u06cc\u062f \u0628\u0647\u062a\u0631\u06cc\u0646 \u0628\u0631\u0646\u0627\u0645\u0647 \u0647\u0627 \u0631\u0648 \u0628\u0633\u0627\u0632\u06cc\u0645 \u0628\u0631\u0627\u062a\u0648\u0646.\n\n Binosha.com\/donate\n\n\n \u0633\u0627\u0628\u0633\u06a9\u0631\u0627\u06cc\u0628 \u06a9\u0631\u062f\u0646 \u06a9\u0627\u0646\u0627\u0644 \u06cc\u0648\u062a\u0648\u0628 \u06cc\u0627\u062f\u062a\u0648\u0646 \u0646\u0631\u0647 \u06a9\u0647","cat_id":10,"cat_name":"\u0639\u0644\u0645 \u0648 \u062a\u06a9\u0646\u0648\u0644\u0648\u0698\u06cc","cat_name_en":"tech","autoplay":true,"video_date_status":"notset","360d":false,"deleteurl":"","playeradvertcornel":"","has_comment":"yes","has_comment_txt":"","size":"19482885","watch_action":{"type":"watch"},"cost_type":{"type":"free"},"can_download":true,"like_cnt":164,"follow_link":null,"follow_status":null,"ip_address":"178.239.167.175"}}';
int a = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // String ddd = 'assets/binosha.txt';
  // final String response = await rootBundle.loadString(ddd);
  // s = await json.decode(response);
  // s = await getChannelData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: appbarColor,

          appBarTheme: AppBarTheme(color: appbarColor)),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SiteModule si = new SiteModule(id: 0, index: 0, title: 'افزونه سایت', siteAddress: 'https://www.google.com');
  CallModule c = new CallModule(id: 1, index: 1, title: 'افزونه تماس', phoneNumber: '112');
  AparatModule aparatModule = new AparatModule(id: moduleList.length, index: moduleList.length, title: 'افزونه آپارات', graphics: 1, aparatType: 2, data: "5zOim,qBXf5");
  AparatModule a1 = new AparatModule(id: moduleList.length, index: moduleList.length, title: 'افزونه آپارات', graphics: 0, aparatType: 3, data: "Binoshacast");
  AboutusModule au1 = new AboutusModule(
    id: moduleList.length,
    index: moduleList.length,
    graphics: 4,
    title: 'اپ بساز',
    text: 'ما استارتاپ اپ بساز می باشیم و قرار است تمامی رقبا را پشت سر گذاشته و از آن ها جلو بزنیم، ما میتوانیم با ایجاد شعبه های بین المللی بینی اپتو را به خاک بمالیم (اپتو می گوید: بچه بیا پایین سرمون درد گرفت)',
    cardWidgetList: [
      CardWidget(
        title: 'ایمان هاونگی',
        text: 'تیم اپ بساز متشکل از 6 نفر می باشد. بچه های تیم اپ بساز در اکثر اوقات روز صدای سگ میدهند. هر شب ساعت 10 می توانید زوزه های ایمان را در دیسکورد بشنوید.',
        image: 'iman.jpg',
      ),
      CardWidget(
        title: 'سجاد ضیائی',
        text: 'hello',
        image: 'iman.jpg',
      )
    ],
    iconLinkWidgetList: [
      IconLinkWidget(
          size: 60,
          link: 'https://www.facebook.com',
          image: 'facebook.jpg'
      ),
      IconLinkWidget(
          size: 60,
          link: 'https://www.telegram.org',
          image: 'telegram.jpg'
      ),
      IconLinkWidget(
          size: 60,
          link: 'https://www.youtube.com',
          image: 'youtube.jpg'
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    ContentModule cmm = new ContentModule(
      id: moduleList.length,
      index: moduleList.length,
      graphics: 3,
      contentModuleList: [si, c, aparatModule],
      mainSetState: (){setState(() {

      });},
    );
    for (int a = 0; a < moduleList.length; a++)
      if (findModuleByIndex(a) != null) print('yse');

    for (int a = 0; a < moduleList.length; a++) {
      if (moduleList[a].visibility == true) print('IT IS');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(moduleList.length.toString()),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          List<Module> ls = [];
          for (Module m in moduleList) {
            if (m.visibility == true) ls.add(m);
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 4,
                childAspectRatio: 1.25),
            itemCount: ls.length,
            itemBuilder: (BuildContext context, int index) {
              ScrollController _controller;
              String string = '';

              string = (ls[index].type == 1)
                  ? 'CallModule'
                  : (ls[index].type == 2)
                  ? 'SiteModule'
                  : (ls[index].type == 3)
                  ? 'ListModule'
                  : 'SettingsModule';
              return ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ls[index]));
                },
                child: Container(
                  child: Column(
                    children: [
                      (ls[index].imageName != '')
                          ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(ls[index].imageName))),
                      )
                          : Container(
                        height: 100,
                        width: 100,
                      ),
                      (ls[index].title == '')
                          ? Text(string)
                          : Text(ls[index].title),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(27)))),
              );

              // Container(
              //     height: 100,
              //     width: 100,
              //     child: ElevatedButton(
              //       child: Text(index.toString() + s),
              //       onPressed: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => findModuleByIndex(index)!));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cmm.addModule(c);
            // print(premiumPlanMonthly.description);
            // print(premiumPlanYearly.description);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => ZarinPalTest(planId: 1)));

            // findModuleById(1)!.setVisibility(!findModuleById(1)!.visibility);
          });
        },
        tooltip: 'add contact us module',
        child: Icon(Icons.add),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: appbarColor,
    //     title: Text(moduleList.length.toString()),
    //   ),
    //   body: ListView.builder(
    //       itemCount: moduleList.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         ScrollController _controller;
    //         String s = (findModuleByIndex(index)!.type == 1)
    //             ? 'CallModule'
    //             : (findModuleByIndex(index)!.type == 2)
    //                 ? 'SiteModule'
    //                 : (findModuleByIndex(index)!.type == 3)
    //                     ? 'ListModule'
    //                     : (findModuleByIndex(index)!.type == 4) ? 'SettingsModule' : 'OnlineGallery';
    //         return Container(
    //             height: 100,
    //             width: 100,
    //             child: ElevatedButton(
    //               child: Text(index.toString() + s),
    //               onPressed: () {
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => findModuleByIndex(index)!));
    //               },
    //             ));
    //       }),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       print(appbarColor.toString());
    //
    //       setState(() {
    //         // SettingsModule a = new SettingsModule(
    //         //   id: 2,
    //         //   index: 2,
    //         //   font: 0,
    //         //   fontSize: 11,
    //         //   isBold: true,
    //         //   textColor: Colors.black,
    //         //   appBarColor: Colors.blue,
    //         //   backgroundColor: Colors.white,
    //         //   imageName: "",
    //         //   mainSetState: () {
    //         //     setState(() {});
    //         //   },
    //         // );
    //         // AparatModule aparatModule = new AparatModule(id: 2, index: 2, aparatType: 1, data: "https://www.aparat.com/video/video/embed/videohash/PoF6Z/vt/frame");
    //         // findAparatModuleById(2)?.editAparatModule(1,'5zOim');
    //         findAparatModuleById(2)?.editAparatModule(1,'5zOim');
    //         AparatModule(id: moduleList.length, index: moduleList.length, graphics: 0, aparatType: 1, data: "5zOim");
    //       });
    //     },
    //     tooltip: 'add call module',
    //     child: Icon(Icons.add),
    //   ),
    // );
  }
}
