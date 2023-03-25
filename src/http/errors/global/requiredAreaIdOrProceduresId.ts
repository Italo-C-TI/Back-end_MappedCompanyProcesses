export class RequiredAreaIdOrProcedureIdError extends Error {
    constructor() {
      super('Necessário areaId ou procedureId como parâmetro!')
    }
  }