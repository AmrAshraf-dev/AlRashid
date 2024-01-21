
import 'package:alrashid_mall_app/models/route_position.dart';
import 'package:alrashid_mall_app/models/shop_position.dart';
import 'package:sqflite/sqflite.dart';

import 'database_service.dart';

class DatabaseInfoService extends DatabaseService {
  Database? currentDatabase;
  DatabaseInfoService() {
    print('object DB Created');
    initDatabase();
  }
  Future initDatabase() async {
    if (currentDatabase != null && currentDatabase?.isOpen == true) {
      print('object DB open');
      currentDatabase!.close();
      await Future.delayed(const Duration(microseconds: 50));
    }
    print('Connection To DB');
    currentDatabase = await openDatabaseConnection(
      'mall_database.sqlite3',
      'assets/database/mall_database.sqlite3',
      isReadOnly: false,
    );
    print('Connected');
  }

  Future<ShopPositionModel> insertShopPosition(
      ShopPositionModel shopPosition) async {
    await initDatabase();
    print('insertikng Data');
    shopPosition.id =
        await currentDatabase!.insert('places_points', shopPosition.toJson());
    return shopPosition;
  }

  Future<List<ShopPositionModel>> getShopPositions(int floor) async {
    await initDatabase();
    List<Map<String, dynamic>> maps = await currentDatabase!
        .rawQuery("select * from places_points where floor =  $floor");
    return maps.map((e) => ShopPositionModel.fromJson(e)).toList();
  }

  Future<List<RoutePositionModel>> getRoutePosition(int floor) async {
    await initDatabase();
    List<Map<String, dynamic>> maps = await currentDatabase!
        .rawQuery("select * from route_points where floor =  $floor");
    return maps.map((e) => RoutePositionModel.fromJson(e)).toList();
  }

  Future<RoutePositionModel> insertRoutePosition(
      RoutePositionModel routePosition) async {
    await initDatabase();
    routePosition.id =
        await currentDatabase!.insert('route_points', routePosition.toJson());
    return routePosition;
  }

  void dispose() {
    currentDatabase!.close();
  }
}
