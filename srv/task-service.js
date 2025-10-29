const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
  const { Tasks } = this.entities;

  // Antes de criar tarefa → preencher campos padrão
  this.before('CREATE', 'Tasks', (req) => {
    const data = req.data;
    if (!data.status) data.status = 'New';
    if (!data.createdAt) data.createdAt = new Date().toISOString();
  });

  // Depois de atualizar tarefa → se marcada como Done, registar data de conclusão
  this.after('UPDATE', 'Tasks', async (data, req) => {
    if (data.status === 'Done' && !data.completedAt) {
      await UPDATE(Tasks)
        .set({ completedAt: new Date().toISOString() })
        .where({ ID: data.ID });
    }
  });
});
