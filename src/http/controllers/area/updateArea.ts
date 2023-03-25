import { prisma } from "@/lib/prisma";
import { z } from "zod";
import { FastifyReply, FastifyRequest } from "fastify";
import { NotFoundAreaError, UpdateAreaError } from "@/http/errors";

export const updateArea = async (req: FastifyRequest, res: FastifyReply) => {
    const QuerySchema = z.object({
        id: z.string(),
    })

    const bodySchema = z.object({
        name: z.string(),
        description: z.coerce.string()
    });

    const { id: uptadeId } = QuerySchema.parse(req.query);

    const { name, description } = bodySchema.parse(req.body);

    try {
        const area = await prisma.area.findUnique({ where: { id: uptadeId } });

        if (!area) {
            return new NotFoundAreaError();
        }

        await prisma.area.update({
            where: { id: uptadeId },
            data: { name, description }
        });

        return res.status(200).send()

    } catch (error) {
        console.log(error)
        throw new UpdateAreaError();
    }

}