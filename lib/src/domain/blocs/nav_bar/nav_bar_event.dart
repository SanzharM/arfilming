part of 'nav_bar_bloc.dart';

@immutable
abstract class NavBarEvent extends Equatable {}

class NavBarChangeIndexEvent extends NavBarEvent {
  final int index;

  NavBarChangeIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}
