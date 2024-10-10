part of 'detail_mountain_bloc.dart';  

/// Represents the state of DetailMountain in the application.  

// ignore_for_file: must_be_immutable  
class DetailMountainState extends Equatable {  
  DetailMountainState({this.detailMountainModelObj});  

  DetailMountainModel? detailMountainModelObj;  

  @override  
  List<Object?> get props => [detailMountainModelObj];  
  DetailMountainState copyWith({DetailMountainModel? detailMountainModelObj}) {  
    return DetailMountainState(  
      detailMountainModelObj: detailMountainModelObj ?? this.detailMountainModelObj,  
    );  
  }  
}