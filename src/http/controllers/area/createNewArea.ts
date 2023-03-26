import { prisma } from "@/lib/prisma";
import { z } from "zod";
import { FastifyReply, FastifyRequest } from "fastify";
import { CreateError } from "@/http/errors";

export const createNewArea = async (req: FastifyRequest, res: FastifyReply) => {
    const bodySchema = z.object({
        name: z.string(),
        description: z.string().optional()
    });

    const { name, description } = bodySchema.parse(req.body);

    try {
        await prisma.area.create({
            data: { name, description },
        })

    } catch (error) {
        console.log(error);
        throw new CreateError();
    }

    return res.status(201).send();
}
