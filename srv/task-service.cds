using smartsolutions from '/home/user/projects/Academy/db/data_model.cds';

service TaskService {
  entity Users as projection on smartsolutions.User;
  entity Tasks as projection on smartsolutions.Task;
}
