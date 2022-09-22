abstract class AddUserToFirestoreStates {}

class AddUserToFirestoreInitialState extends AddUserToFirestoreStates {}

class AddUserToFirestoreAddingState extends AddUserToFirestoreStates {}

class AddUserToFirestoreAddedState extends AddUserToFirestoreStates {}

class AddUserToFirestoreErrorState extends AddUserToFirestoreStates {
  final String error;

  AddUserToFirestoreErrorState(this.error);
}
