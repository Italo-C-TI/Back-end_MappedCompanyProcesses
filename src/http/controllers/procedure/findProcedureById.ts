import { prisma } from "@/lib/prisma";
import { z } from "zod";
import { FastifyReply, FastifyRequest } from "fastify";
import { DetailsProcedureError, NotFoundProcedureError } from "@/http/errors";

export const findProcedureById = async (req: FastifyRequest, res: FastifyReply) =>{
    const QuerySchema = z.object({
        id: z.string() ,
      })

    const { id: requestedId } = QuerySchema.parse(req.query);

    
    try {
        const procedure = await prisma.procedure.findUnique({ where: {id: requestedId } });

        if (!procedure) {
           throw new NotFoundProcedureError();
        }
        
        return res.status(200).send({ procedure });

    } catch (error) {
        console.log(error);
        throw new DetailsProcedureError();
    }
}