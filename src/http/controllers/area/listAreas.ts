import { prisma } from "@/lib/prisma";
import { z } from "zod";
import { FastifyReply, FastifyRequest } from "fastify";
import { ListError } from "@/http/errors";

export const listAreas = async (req: FastifyRequest, res: FastifyReply) => {
    const QuerySchema = z.object({
        size: z.coerce.number().default(5),
        page: z.coerce.number().min(1).default(1),
    })

    const { size, page } = QuerySchema.parse(req.query)

    try {
        const areas = await prisma.area.findMany({
            take: size,
            skip: (page - 1) * size,
        });

        return res.status(200).send({
            areas,
        })
    } catch (error) {
        console.log(error);
        throw new ListError()
    }
}