using { smartsolutions as my } from './data_model.cds';

annotate my.User with @PersonalData : {
  DataSubjectRole : 'ApplicationUser',
  EntitySemantics : 'DataSubject'
} {
  ID       @PersonalData.FieldSemantics : 'DataSubjectID';
  username @PersonalData.IsPotentiallyPersonal;
  email    @PersonalData.IsPotentiallyPersonal;
};

annotate my.Task with @PersonalData : {
  EntitySemantics : 'Other'
} {
  // The assignedTo association links this task to the data subject (User).
  assignedTo  @PersonalData.FieldSemantics : 'DataSubjectID';

  // The title and description could potentially contain personal information
  // entered by users.
  title       @PersonalData.IsPotentiallyPersonal;
  description @PersonalData.IsPotentiallyPersonal;
};