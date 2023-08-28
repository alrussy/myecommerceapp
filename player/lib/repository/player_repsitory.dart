






import 'package:hive_flutter/hive_flutter.dart';
import 'package:player/entity/play_list.dart';

class PlayerRepository{

  static Box<PlayList> getBox()=>Hive.box<PlayList>('playlists');
  static closeBox()async=> await getBox().close();
}