part of "main_bloc.dart";

final class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => <Object?>[];
}

final class MainEventChangeMenu extends MainEvent {
  const MainEventChangeMenu(this.menu);

  final MainMenu menu;

  @override
  List<Object?> get props => <Object?>[menu];
}
