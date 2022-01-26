enum Difficulty { easy, medium, hard }

enum Categories { mindset, health, workout }

enum ChallengeState { started, complete, stopped, notStarted }

class Challenge {
  String? challenge;
  List<String>? category;
  Difficulty? difficulty;
  ChallengeState? state;
  DateTime? startDate;
  DateTime? completeDate;

  Challenge({
    this.challenge,
    this.category,
    this.difficulty,
    this.state,
    this.startDate,
    this.completeDate,
  });
}
