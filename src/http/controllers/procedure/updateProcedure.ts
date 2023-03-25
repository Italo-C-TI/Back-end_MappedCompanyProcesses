import { prisma } from "@/lib/prisma";
import { z } from "zod";
import { FastifyReply, FastifyRequest } from "fastify";
import { NotFoundProcedureError, UpdateAreaError } from "@/http/errors";

export const updateProcedure = async (req: FastifyRequest, res: FastifyReply) => {
    const QuerySchema = z.object({
        id: z.string(),
    })

    const bodySchema = z.object({
        name: z.string(),
        description: z.coerce.string(),
        tools: z.string().array()
    });

    const { id: uptadeId } = QuerySchema.parse(req.query);

    const { name, description, tools } = bodySchema.parse(req.body);

    try {
        const procedure = await prisma.procedure.findUnique({ where: { id: uptadeId } });

        if (!procedure) {
            return new NotFoundProcedureError();
        }

        await prisma.procedure.update({
            where: { id: uptadeId },
            data: { name, description, tools }
        });

        return res.status(200).send();

    } catch (error) {
        console.log(error)
        throw new UpdateAreaError();
    }

}