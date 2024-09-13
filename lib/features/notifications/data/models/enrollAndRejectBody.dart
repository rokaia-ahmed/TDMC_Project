class EnrollAndRejectBody{
String id ;
String workshopId ;
String rejectReason ;
int status ;

EnrollAndRejectBody({
  required this.id,
  required this.workshopId,
  required this.rejectReason,
  required this.status});
}