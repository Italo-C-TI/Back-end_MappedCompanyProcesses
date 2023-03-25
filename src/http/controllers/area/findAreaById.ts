import { prisma } from "@/lib/prisma";
import { z } from "zod";
import { FastifyReply, FastifyRequest } from "fastify";
import { DetailsAreaError, NotFoundAreaError } from "@/http/errors";

export const findAreaById = async (req: FastifyRequest, res: FastifyReply) => {
    const QuerySchema = z.object({
        id: z.string(),
    })

    const { id: requestedId } = QuerySchema.parse(req.query);


    try {
        const area = await prisma.area.findUnique({ where: { id: requestedId } });

        if (!area) {
            throw new NotFoundAreaError();
        }
        return res.status(200).send({ area })

    } catch (error) {
        console.log(error);
        throw new DetailsAreaError();
    }
}