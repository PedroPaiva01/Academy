namespace smartsolutions;
using {cuid,managed } from '@sap/cds/common.cds';

entity User:cuid,managed {
  username: String(50);
  email: String(100);
  tasks: Association to many Task on tasks.assignedTo = $self;
}

entity Task {
  key ID: UUID;
  title: String(100);
  description: String(500);
  priority: String enum {
    Low;
    Medium;
    High;
  };
  status: String enum {
    New;
    InProgress;
    Done;
  };
  dueDate: Date;
  createdAt: DateTime;
  completedAt: DateTime;
  assignedTo: Association to User;
}
