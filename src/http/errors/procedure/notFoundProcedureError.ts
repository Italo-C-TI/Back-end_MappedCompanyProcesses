export class NotFoundProcedureError extends Error {
    constructor() {
      super('Não foi possível encontrar o procedimento!');
    }
  }