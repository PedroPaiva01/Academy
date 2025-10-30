namespace smartsolutions;

using {
  cuid,
  managed
} from '@sap/cds/common.cds';

entity User : cuid, managed {
  username : String(50)               @title: '{i18n>User.username}'  @mandatory;
  email    : String(100)              @title: '{i18n>User.email}'     @mandatory;
  tasks    : Association to many Task @title: '{i18n>User.tasks}'
               on tasks.assignedTo = $self;
}

entity Task {
  key ID          : UUID;
      title       : String(100)          @title: '{i18n>Task.title}'       @mandatory;
      description : String(500)          @title: '{i18n>Task.description}';
      priority    : String               @title: '{i18n>Task.priority}'    @mandatory  enum {
        Low                              @title: '{i18n>Task.low}';
        Medium                           @title: '{i18n>Task.medium}';
        High                             @title: '{i18n>Task.high}'
      };
      status      : String               @title: '{i18n>Task.status}'      @mandatory  enum {
        New                              @title: '{i18n>Task.new}';
        InProgress                       @title: '{i18n>Task.inProgress}';
        Done                             @title: '{i18n>Task.done}'
      };
      dueDate     : Date                 @title: '{i18n>Task.dueDate}'     @mandatory;
      createdAt   : DateTime             @title: '{i18n>Task.createdAt}';
      updatedAt   : DateTime             @title: '{i18n>Task.updatedAt}';
      completedAt : DateTime             @title: '{i18n>Task.completedAt}';
      assignedTo  : Association to User  @title: '{i18n>Task.assignedTo}'  @mandatory;
}
