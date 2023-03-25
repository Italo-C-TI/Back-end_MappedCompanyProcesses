export class NotFoundAreaError extends Error {
    constructor() {
      super('Não foi possível encontrar a área!')
    }
  }