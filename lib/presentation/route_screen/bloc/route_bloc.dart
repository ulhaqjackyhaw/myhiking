import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/route_model.dart';
import '../models/routelistsection_item_model.dart';

part 'route_event.dart';
part 'route_state.dart';

/// A bloc that manages the state of a Route according to the event that is dispatched to it.
class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc(super.initialState) {
    on<RouteInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RouteInitialEvent event,
    Emitter<RouteState> emit,
  ) async {
    emit(
      state.copyWith(
        routeModelObj: state.routeModelObj?.copyWith(
          routelistsectionItemList: fillRoutelistsectionItemList(),
        ),
      ),
    );
  }

  List<RoutelistsectionItemModel> fillRoutelistsectionItemList() {
    return [
      RoutelistsectionItemModel(
        tinggiOne: ImageConstant.imgDownload,
        height: "Tinggi",
        zipcode: "3432",
        meters: "m",
      ),
      RoutelistsectionItemModel(
        tinggiOne: ImageConstant.imgSettings,
        height: "Jarak",
        zipcode: "5",
        meters: "km",
      ),
      RoutelistsectionItemModel(),
    ];
  }
}
