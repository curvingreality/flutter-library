import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuReIcons {
  static IconData get playArrow =>
      CuReUtils.isIos() ? CupertinoIcons.play_arrow : Icons.play_arrow;
  static IconData get close =>
      CuReUtils.isIos() ? CupertinoIcons.clear : Icons.close;
  static IconData get closeCircle =>
      CuReUtils.isIos() ? CupertinoIcons.clear_circled : Icons.cancel_outlined;
  static IconData get check =>
      CuReUtils.isIos() ? CupertinoIcons.check_mark : Icons.check;
  static IconData get checkCircle => CuReUtils.isIos()
      ? CupertinoIcons.check_mark_circled
      : Icons.check_circle;
  static IconData get arrowForward =>
      CuReUtils.isIos() ? CupertinoIcons.forward : Icons.arrow_forward;
  static IconData get arrowBack =>
      CuReUtils.isIos() ? CupertinoIcons.back : Icons.arrow_back;
  static IconData get arrowRight =>
      CuReUtils.isIos() ? CupertinoIcons.arrow_right : Icons.arrow_right;
  static IconData get add => CuReUtils.isIos() ? CupertinoIcons.add : Icons.add;
  static IconData get person =>
      CuReUtils.isIos() ? CupertinoIcons.person : Icons.person;
  static IconData get home =>
      CuReUtils.isIos() ? CupertinoIcons.home : Icons.home;
  static IconData get book =>
      CuReUtils.isIos() ? CupertinoIcons.book : Icons.book;
  static IconData get settings =>
      CuReUtils.isIos() ? CupertinoIcons.settings : Icons.settings;
  static IconData get brightnessAuto =>
      CuReUtils.isIos() ? CupertinoIcons.sun_haze : Icons.brightness_auto;
  static IconData get brightnessHigh =>
      CuReUtils.isIos() ? CupertinoIcons.sun_max : Icons.brightness_7;
  static IconData get brightnessLow =>
      CuReUtils.isIos() ? CupertinoIcons.moon : Icons.brightness_3;
  static IconData get work =>
      CuReUtils.isIos() ? CupertinoIcons.briefcase : Icons.work;
  static IconData get web =>
      CuReUtils.isIos() ? CupertinoIcons.globe : Icons.web;
  static IconData get reset =>
      CuReUtils.isIos() ? CupertinoIcons.restart : Icons.refresh;
  static IconData get delete =>
      CuReUtils.isIos() ? CupertinoIcons.delete : Icons.delete;
  static IconData get vibrate => Icons.vibration;
  static IconData get volumeUp =>
      CuReUtils.isIos() ? CupertinoIcons.volume_up : Icons.volume_up;
  static IconData get hint =>
      CuReUtils.isIos() ? CupertinoIcons.lightbulb : Icons.lightbulb;
  static IconData get hourglassBottom => CuReUtils.isIos()
      ? CupertinoIcons.hourglass_bottomhalf_fill
      : Icons.hourglass_bottom;
  static IconData get verified =>
      CuReUtils.isIos() ? CupertinoIcons.checkmark_seal_fill : Icons.verified;
  static IconData get analyticsOutlined =>
      CuReUtils.isIos() ? CupertinoIcons.chart_bar : Icons.analytics_outlined;
  static IconData get analytics =>
      CuReUtils.isIos() ? CupertinoIcons.chart_bar_alt_fill : Icons.analytics;
  static IconData get search =>
      CuReUtils.isIos() ? CupertinoIcons.search : Icons.search;
  static IconData get calendar =>
      CuReUtils.isIos() ? CupertinoIcons.calendar : Icons.calendar_today;
  static IconData get locked =>
      CuReUtils.isIos() ? CupertinoIcons.lock_fill : Icons.lock_outline_rounded;
  static IconData get trophyOutlined => Icons.emoji_events_outlined;
  static IconData get trophy => Icons.emoji_events;
  static IconData get clock => CuReUtils.isIos()
      ? CupertinoIcons.clock_fill
      : Icons.access_time_filled_rounded;
  static IconData get clockOutlined =>
      CuReUtils.isIos() ? CupertinoIcons.clock : Icons.access_time;
  static IconData get celebration =>
      CuReUtils.isIos() ? CupertinoIcons.sparkles : Icons.celebration;
  static IconData get warning => CuReUtils.isIos()
      ? CupertinoIcons.exclamationmark_triangle_fill
      : Icons.warning;
  static IconData get download => CuReUtils.isIos()
      ? CupertinoIcons.cloud_download_fill
      : Icons.cloud_download;
  static IconData get review =>
      CuReUtils.isIos() ? CupertinoIcons.star_fill : Icons.star_rate_rounded;
  static IconData get militaryTech => Icons.military_tech_outlined;
  static IconData get save =>
      CuReUtils.isIos() ? CupertinoIcons.floppy_disk : Icons.save;
  static IconData get user => CuReUtils.isIos()
      ? CupertinoIcons.person_alt_circle
      : Icons.account_circle_outlined;
  static IconData get mail =>
      CuReUtils.isIos() ? CupertinoIcons.mail : Icons.email_outlined;
  static IconData get lock =>
      CuReUtils.isIos() ? CupertinoIcons.lock_fill : Icons.lock;
  static IconData get logout =>
      CuReUtils.isIos() ? CupertinoIcons.square_arrow_left : Icons.logout;
  static IconData get number =>
      CuReUtils.isIos() ? CupertinoIcons.number : Icons.numbers;
  static IconData get info =>
      CuReUtils.isIos() ? CupertinoIcons.info : Icons.info_outline_rounded;
  static IconData get error => CuReUtils.isIos()
      ? CupertinoIcons.exclamationmark_circle
      : Icons.error_outline;
  static IconData get airplane =>
      CuReUtils.isIos() ? CupertinoIcons.airplane : Icons.airplanemode_active;
  static IconData get moreVert =>
      CuReUtils.isIos() ? CupertinoIcons.ellipsis_vertical : Icons.more_vert;
  static IconData get moreHoriz =>
      CuReUtils.isIos() ? CupertinoIcons.ellipsis : Icons.more_horiz;
  static IconData get share =>
      CuReUtils.isIos() ? CupertinoIcons.share : Icons.share;
  static IconData get gallery => CuReUtils.isIos()
      ? CupertinoIcons.photo_fill_on_rectangle_fill
      : Icons.photo_library;
  static IconData get mapFill =>
      CuReUtils.isIos() ? CupertinoIcons.map_fill : Icons.map;
  static IconData get backspace =>
      CuReUtils.isIos() ? CupertinoIcons.delete_left : Icons.backspace;
  static IconData get chevronDown =>
      CuReUtils.isIos() ? CupertinoIcons.chevron_down : Icons.expand_more;
  static IconData get chevronUp =>
      CuReUtils.isIos() ? CupertinoIcons.chevron_up : Icons.expand_less;
  static IconData get location =>
      CuReUtils.isIos() ? CupertinoIcons.location_fill : Icons.location_on;
  static IconData get place => Icons.place;
  static IconData get question =>
      CuReUtils.isIos() ? CupertinoIcons.question : Icons.help;
  static IconData questionOutline = CuReUtils.isIos()
      ? CupertinoIcons.question_circle
      : Icons.help_outline_rounded;
  static IconData get list =>
      CuReUtils.isIos() ? CupertinoIcons.list_bullet : Icons.list;
  static IconData get dragHandle =>
      CuReUtils.isIos() ? CupertinoIcons.line_horizontal_3 : Icons.drag_handle;
  static IconData get target =>
      CuReUtils.isIos() ? CupertinoIcons.flag : Icons.flag;
  static IconData get laptop =>
      CuReUtils.isIos() ? CupertinoIcons.device_laptop : Icons.laptop_mac;
  static IconData get text =>
      CuReUtils.isIos() ? CupertinoIcons.textformat : Icons.text_fields;
  static IconData get phone =>
      CuReUtils.isIos() ? CupertinoIcons.phone : Icons.phone_android;
  static IconData get folder =>
      CuReUtils.isIos() ? CupertinoIcons.folder : Icons.folder_open;
  static IconData get pause =>
      CuReUtils.isIos() ? CupertinoIcons.pause : Icons.pause;
  static IconData get music =>
      CuReUtils.isIos() ? CupertinoIcons.music_note : Icons.music_note;
  static IconData get arrowDown =>
      CuReUtils.isIos() ? CupertinoIcons.arrow_down : Icons.arrow_downward;
  static IconData get chartBar =>
      CuReUtils.isIos() ? CupertinoIcons.chart_bar : Icons.bar_chart;
  static IconData get volumeOff =>
      CuReUtils.isIos() ? CupertinoIcons.speaker_slash : Icons.volume_off;
  static IconData get arrowLeft =>
      CuReUtils.isIos() ? CupertinoIcons.arrow_left : Icons.arrow_left;
  static IconData get chartPie =>
      CuReUtils.isIos() ? CupertinoIcons.chart_pie : Icons.pie_chart;
  static IconData get heart =>
      CuReUtils.isIos() ? CupertinoIcons.heart_fill : Icons.favorite;
  static IconData get star =>
      CuReUtils.isIos() ? CupertinoIcons.star_fill : Icons.star;
  static IconData get leaderboard =>
      CuReUtils.isIos() ? CupertinoIcons.chart_bar : Icons.leaderboard;
  static IconData get circle =>
      CuReUtils.isIos() ? CupertinoIcons.circle_fill : Icons.circle;
  static IconData get sun =>
      CuReUtils.isIos() ? CupertinoIcons.sun_max_fill : Icons.wb_sunny;
  static IconData get sound => CuReUtils.isIos()
      ? CupertinoIcons.speaker_3_fill
      : Icons.volume_up_rounded;
  static IconData get flag =>
      CuReUtils.isIos() ? CupertinoIcons.flag_fill : Icons.flag;
}
