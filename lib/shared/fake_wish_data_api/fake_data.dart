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
    ),
    Wish(
      id: '321',
      name: 'Permen milkita',
      savingTarget: 2000,
      savingPlan: SavingPlan.daily,
      savingNominal: 500,
      listSaving: [
        Saving(savingNominal: 1000, createdAt: DateTime(2023, 3, 1, 7, 25), message: 'Awal tahun'),
        Saving(savingNominal: -500, createdAt: DateTime(2023, 3, 3, 11, 29), message: 'Pinjam gope'),
        Saving(savingNominal: 1500, createdAt: DateTime(2023, 3, 5, 16, 56), message: 'Hehe'),
      ],
      createdAt: DateTime.parse('2023-03-01'),
      completedAt: DateTime.parse('2023-03-15'),
      imagePath: null,
    ),
    Wish(
      id: '456',
      name: 'Permen kopiko',
      savingTarget: 1000,
      savingPlan: SavingPlan.weekly,
      savingNominal: 500,
      listSaving: [
        Saving(savingNominal: 1000, createdAt: DateTime(2023, 3, 1, 7, 25), message: 'Awal tahun'),
        Saving(savingNominal: -500, createdAt: DateTime(2023, 3, 3, 11, 29), message: 'Pinjam gope'),
        Saving(savingNominal: 500, createdAt: DateTime(2023, 3, 5, 16, 56), message: 'Hehe'),
      ],
      createdAt: DateTime.parse('2023-03-01'),
      completedAt: DateTime.parse('2023-03-15'),
      imagePath: null,
    ),
    Wish(
      id: '239',
      name: 'Permen Relaxa',
      savingTarget: 500,
      savingPlan: SavingPlan.monthly,
      savingNominal: 500,
      listSaving: [
        Saving(savingNominal: 400, createdAt: DateTime(2023, 3, 1, 7, 25), message: 'Awal tahun'),
        Saving(savingNominal: -100, createdAt: DateTime(2023, 3, 3, 11, 29), message: 'Pinjam'),
        Saving(savingNominal: 200, createdAt: DateTime(2023, 3, 3, 11, 29), message: 'Pinjam'),
      ],
      createdAt: DateTime.parse('2023-03-01'),
      completedAt: DateTime.parse('2023-04-15'),
      imagePath: null,
    ),
  ];
}
