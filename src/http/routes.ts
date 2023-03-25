import { FastifyInstance, FastifyReply, FastifyRequest } from "fastify";
import { createNewArea, deleteArea, findAreaById, listAreas, updateArea } from "./controllers/area";
import { createNewProcedure, deleteProcedure, findProcedureById, listProceduresByAreaIdOrProcedureId, updateProcedure } from "./controllers/procedure";

export async function appRoutes(app: FastifyInstance) {
    app.get('/', (req: FastifyRequest, res: FastifyReply) => {
        return res.status(200).send(
            "hello world"
        )
    })

    app.get('/areas', listAreas);
    app.post('/area', createNewArea);
    app.get('/area', findAreaById);
    app.put('/area', updateArea);
    app.delete('/area', deleteArea);

    app.get('/procedures', listProceduresByAreaIdOrProcedureId);
    app.post('/procedure', createNewProcedure);
    app.get('/procedure', findProcedureById);
    app.put('/procedure', updateProcedure);
    app.delete('/procedure', deleteProcedure);
}
