part of 'fake_data_api.dart';

class FakeWishList {
  List<Wish> fakeWishList = [
    Wish(
      id: '123',
      name: 'Kursi Gaming',
      savingTarget: 2000000,
      savingPlan: SavingPlan.weekly,
      savingNominal: 50000,
      listSaving: [
        Saving(savingNominal: 15000, createdAt: DateTime(2023, 1, 1, 7, 25), message: 'Awal tahun'),
        Saving(savingNominal: -5000, createdAt: DateTime(2023, 1, 3, 11, 29), message: 'Pinjam goceng'),
        Saving(savingNominal: 10000, createdAt: DateTime(2023, 1, 5, 16, 56), message: 'Awal tahun'),
      ],
      createdAt: DateTime.parse('2023-03-14'),
      completedAt: null,
      imagePath: null,
    )
  ];
}
