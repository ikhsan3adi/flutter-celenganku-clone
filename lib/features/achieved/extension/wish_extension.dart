import 'package:celenganku_app_clone/shared/shared.dart';

extension AchievedExtension on Wish {
  int durationToAchieve() {
    Duration duration = completedAt!.difference(createdAt);
    switch (savingPlan) {
      case SavingPlan.daily:
        return duration.inDays;
      case SavingPlan.weekly:
        return duration.inWeek;
      case SavingPlan.monthly:
        return duration.inMonth;
    }
  }
}
