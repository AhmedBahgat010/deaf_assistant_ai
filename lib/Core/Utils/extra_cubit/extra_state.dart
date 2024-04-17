
sealed class ExtrasState {}

final class ExtrasStateInitial extends ExtrasState {}


class GetModelResponseLoadingState extends ExtrasState {}

class GetModelResponseLoadedState extends ExtrasState {}

class GetModelResponseErrorState extends ExtrasState {
  final String message;

  GetModelResponseErrorState(this.message);
}
class SetItemIDValueLoadingState extends ExtrasState {}

class SetItemIDValueLoadedState extends ExtrasState {}

class SetItemIDValueErrorState extends ExtrasState {
  final String message;

  SetItemIDValueErrorState(this.message);
}

class GetItemIDValueLoadingState extends ExtrasState {}

class GetItemIDValueLoadedState extends ExtrasState {}

class GetItemIDValueErrorState extends ExtrasState {
  final String message;

  GetItemIDValueErrorState(this.message);
}

class GetPackingTypesLoadingState extends ExtrasState {}

class GetPackingTypesLoadedState extends ExtrasState {}

class GetPackingTypesErrorState extends ExtrasState {
  final String message;

  GetPackingTypesErrorState(this.message);
}


class TakeActionLoadingState extends ExtrasState {}

class TakeActionLoadedState extends ExtrasState {}

class TakeActionErrorState extends ExtrasState {
  final String message;

  TakeActionErrorState(this.message);
}


class CreateItemResultActionReasonsLoadingState extends ExtrasState {}

class CreateItemResultActionReasonsLoadedState extends ExtrasState {}

class CreateItemResultActionReasonsErrorState extends ExtrasState {
  final String message;

  CreateItemResultActionReasonsErrorState(this.message);
}




class GetApplicantsLoadingState extends ExtrasState {}

class GetApplicantsLoadedState extends ExtrasState {}

class GetApplicantsErrorState extends ExtrasState {
  final String message;

  GetApplicantsErrorState(this.message);
}

class GetFlagReasonsLoadingState extends ExtrasState {}

class GetFlagReasonsLoadedState extends ExtrasState {}

class GetFlagReasonsErrorState extends ExtrasState {
  final String message;

  GetFlagReasonsErrorState(this.message);
}

class GetFreezeReasonsLoadingState extends ExtrasState {}

class GetFreezeReasonsLoadedState extends ExtrasState {}

class GetFreezeReasonsErrorState extends ExtrasState {
  final String message;

  GetFreezeReasonsErrorState(this.message);
}

class GetProductByNotificationNoLoadingState extends ExtrasState {}

class GetProductByNotificationNoLoadedState extends ExtrasState {}

class GetProductByNotificationNoErrorState extends ExtrasState {
  final String message;

  GetProductByNotificationNoErrorState(this.message);
}

class GetLkupSampleReasonLoadingState extends ExtrasState {}

class GetLkupSampleReasonLoadedState extends ExtrasState {}

class GetLkupSampleReasonErrorState extends ExtrasState {
  final String message;

  GetLkupSampleReasonErrorState(this.message);
}

class TakeActionLocalLoadingState extends ExtrasState {}

class TakeActionLocalLoadedState extends ExtrasState {}

class TakeActionLocalErrorState extends ExtrasState {
  final String message;

  TakeActionLocalErrorState(this.message);
}


class GetVariationTypesLoadingState extends ExtrasState {}

class GetVariationTypesLoadedState extends ExtrasState {}

class GetVariationTypesErrorState extends ExtrasState {
  final String message;

  GetVariationTypesErrorState(this.message);
}

class GetUomTypesLoadingState extends ExtrasState {}

class GetUomTypesLoadedState extends ExtrasState {}

class GetUomTypesErrorState extends ExtrasState {
  final String message;

  GetUomTypesErrorState(this.message);
}

class GetLkupCountryLoadingState extends ExtrasState {}

class GetLkupCountryLoadedState extends ExtrasState {}

class GetLkupCountryErrorState extends ExtrasState {
  final String message;

  GetLkupCountryErrorState(this.message);
}

class GetLkupPortsLoadingState extends ExtrasState {}

class GetLkupPortsLoadedState extends ExtrasState {}

class GetLkupPortsErrorState extends ExtrasState {
  final String message;

  GetLkupPortsErrorState(this.message);
}

class GetLkupCurrencyLoadingState extends ExtrasState {}

class GetLkupCurrencyLoadedState extends ExtrasState {}

class GetLkupCurrencyErrorState extends ExtrasState {
  final String message;

  GetLkupCurrencyErrorState(this.message);
}