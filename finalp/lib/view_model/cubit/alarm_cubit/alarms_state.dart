abstract class AlarmStates {}
class GetAlarmsSuccessState extends AlarmStates{}

class FailedToGetAlarmsState extends AlarmStates{}

class LoadingAlarmsState extends AlarmStates{}

class AlarmInitial extends AlarmStates {}