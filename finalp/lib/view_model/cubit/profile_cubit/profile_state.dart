abstract class ProfileStates {}
class GetProfileSuccessState extends ProfileStates{}

class FailedToGetProfileState extends ProfileStates{}

class LoadingProfileState extends ProfileStates{}

class ProfileInitial extends ProfileStates {}