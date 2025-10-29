using smartsolutions as my from '../db/data_model';

service TaskService {
    @odata.draft.enabled
    entity Tasks as projection on my.Task;

    @odata.draft.enabled
    entity Users as projection on my.User;

}