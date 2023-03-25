export class DetailsProcedureError extends Error {
    constructor() {
      super('Não foi possível trazer os detalhes do procedimento!')
    }
  }