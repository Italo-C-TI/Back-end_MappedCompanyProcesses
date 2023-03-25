import { prisma } from "@/lib/prisma";
import { z } from "zod";
import { FastifyReply, FastifyRequest } from "fastify";
import { CreateError, NotFoundAreaError, NotFoundProcedureError, RequiredAreaIdOrProcedureIdError } from "@/http/errors";

export const createNewProcedure = async (req: FastifyRequest, res: FastifyReply) => {

    const QuerySchema = z.object({
        areaId: z.string().optional(),
        procedureId: z.string().optional()
    })

    const bodySchema = z.object({
        name: z.string(),
        description: z.string().optional(),
        tools: z.string().array()
    });

    let { areaId, procedureId } = QuerySchema.parse(req.query);

    const { name, description, tools } = bodySchema.parse(req.body);


    try {
        if (!areaId && !procedureId) return new RequiredAreaIdOrProcedureIdError();

        if (procedureId) {
            const procedure = await prisma.procedure.findUnique({ where: { id: procedureId } });

            if (!procedure) return new NotFoundProcedureError();

            await prisma.procedure.create({
                data: { procedureId, name, description, tools }
            })

            return res.status(201).send();
        }

        const area = await prisma.area.findUnique({ where: { id: areaId } });

        if (!area) return new NotFoundAreaError();

        await prisma.procedure.create({
            data: { areaId, name, description, tools }
        })

    } catch (error) {
        console.log(error);
        throw new CreateError();
    }

    return res.status(201).send();
}