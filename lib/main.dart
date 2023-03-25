import 'dart:async';
import 'dart:developer';

import 'package:celenganku_app_clone/app.dart';
import 'package:celenganku_app_clone/my_bloc_observer.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
  );

  Bloc.observer = MyBlocObserver();

  // final WishApi fakeWishApi = FakeWishDataApi(fakeWishList: FakeWishList());
  // final WishRepository wishRepository = WishRepository(wishApi: fakeWishApi);

  // initialize hive
  await Hive.initFlutter();
  Hive.registerAdapter(WishAdapter());
  Hive.registerAdapter(SavingPlanAdapter());
  Hive.registerAdapter(SavingAdapter());

  final Box<Wish> box = await Hive.openBox(LocalStorageApi.keyName);
  final WishApi localStorageWishApi = LocalStorageApi(box: box);

  final WishRepository wishRepository = WishRepository(wishApi: localStorageWishApi);

  runZonedGuarded(
    () => runApp(MyApp(wishRepository: wishRepository)),
    (error, stack) => log(error.toString(), stackTrace: stack),
  );
}
