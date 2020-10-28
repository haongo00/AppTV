part of "member.cubit.dart";


@immutable
abstract class MemberState extends Equatable {
  const MemberState();
}

class MemberInitial extends MemberState {
  const MemberInitial();

  @override
  List<Object> get props => [];
}

class MemberLoading extends MemberState {
  const MemberLoading();

  @override
  List<Object> get props => [];
}

class MemberUploading extends MemberState {
  const MemberUploading();

  @override
  List<Object> get props => [];
}

class ItemsMemberLoaded extends MemberState {
  final List<Member> member;

  ItemsMemberLoaded(this.member);

  @override
  List<Object> get props => [member];
}

class ItemsMemberUploading extends MemberState {
  const ItemsMemberUploading();

  @override
  List<Object> get props => [];
}

class ItemsMemberUploaded extends MemberState {
  const ItemsMemberUploaded();

  @override
  List<Object> get props => [];
}

class MemberError extends MemberState {
  final String message;

  const MemberError(this.message);

  @override
  List<Object> get props => [message];
}
