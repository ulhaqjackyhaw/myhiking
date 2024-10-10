import 'package:equatable/equatable.dart';  
import '../../../core/app_export.dart';  
import '../models/detail_mountain_model.dart';  
part 'detail_mountain_event.dart';  
part 'detail_mountain_state.dart';  

/// A bloc that manages the state of a DetailMountain according to the event that is dispatched to it.  
class DetailMountainBloc extends Bloc<DetailMountainEvent, DetailMountainState> {  
  DetailMountainBloc(super.initialState) {  
    on<DetailMountainInitialEvent>(_onInitialize);  
  }  

  _onInitialize(  
    DetailMountainInitialEvent event,  
    Emitter<DetailMountainState> emit,  
  ) async {}  
}