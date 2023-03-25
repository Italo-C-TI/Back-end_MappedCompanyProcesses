import { prisma } from "@/lib/prisma";
import { z } from "zod";
import { FastifyReply, FastifyRequest } from "fastify";
import { DeleteError } from "@/http/errors";

export const deleteProcedure = async (req: FastifyRequest, res: FastifyReply) => {

    const QuerySchema = z.object({
        id: z.string() ,
      })

        const { id: deleteId } = QuerySchema.parse(req.query);

        try {
             await prisma.procedure.delete({
              where: { id: deleteId },
            })
        } catch (error) {
            console.log(error);
            throw new DeleteError()
        } 

        return res.status(200).send()

}