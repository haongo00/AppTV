part of "list-book.cubit.dart";


@immutable
abstract class ListBookState extends Equatable {
  const ListBookState();
}

class ListBookInitial extends ListBookState {
  const ListBookInitial();

  @override
  List<Object> get props => [];
}

class ListBookLoading extends ListBookState {
  const ListBookLoading();

  @override
  List<Object> get props => [];
}

class ListBookUploading extends ListBookState {
  const ListBookUploading();

  @override
  List<Object> get props => [];
}

class ItemsListBookLoaded extends ListBookState {
  final List<Book> listBook;

  ItemsListBookLoaded(this.listBook);

  @override
  List<Object> get props => [listBook];
}

class ItemsListBookUploading extends ListBookState {
  const ItemsListBookUploading();

  @override
  List<Object> get props => [];
}

class ItemsListBookUploaded extends ListBookState {
  const ItemsListBookUploaded();

  @override
  List<Object> get props => [];
}

class ListBookError extends ListBookState {
  final String message;

  const ListBookError(this.message);

  @override
  List<Object> get props => [message];
}
