part of 'fake_data_api.dart';

class FakeWishList {
  List<Wish> fakeWishList = [
    Wish(
      id: '123',
      name: 'Kursi Gaming',
      savingTarget: 2000000,
      savingPlan: SavingPlan.weekly,
      savingNominal: 50000,
      listSaving: const [],
      createdAt: DateTime.parse('2023-03-14'),
      completedAt: null,
      imagePath: null,
    )
  ];
}
