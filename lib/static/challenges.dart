//import 'package:hive/hive.dart';

//part 'challenge.g.dart';

enum Difficulty { easy, medium, hard }

enum Categories { mindset, health, workout }

enum ChallengeState { started, complete, stopped, notStarted }

//@HiveType(typeId: 1)
class Challenge {
  //@HiveField(0)
  String? challenge;
  //@HiveField(1)
  List<String>? category;
  //@HiveField(2)
  Difficulty? difficulty;
  //@HiveField(3)
  ChallengeState? state;
  //@HiveField(4)
  DateTime? startDate;
  //@HiveField(5)
  DateTime? completeDate;
  //@HiveField(6)
  bool selected;

  Challenge({
    this.challenge,
    this.category,
    this.difficulty,
    this.state,
    this.startDate,
    this.completeDate,
    this.selected = false,
  });
}
