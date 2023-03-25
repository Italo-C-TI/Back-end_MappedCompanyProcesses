import { prisma } from "@/lib/prisma";
import { z } from "zod";
import { FastifyReply, FastifyRequest } from "fastify";
import { ListError, RequiredAreaIdOrProcedureIdError } from "@/http/errors";

export const listProceduresByAreaIdOrProcedureId = async (req: FastifyRequest, res: FastifyReply) => {
   const QuerySchema = z.object({
      areaId: z.string().optional(),
      procedureId: z.string().optional(),
      size: z.coerce.number().default(5),
      page: z.coerce.number().min(1).default(1),
   })


   const { size, page, areaId, procedureId } = QuerySchema.parse(req.query);

   try {
      if (!areaId && !procedureId) return new RequiredAreaIdOrProcedureIdError();

      if (procedureId) {
         const procedures = await prisma.procedure.findMany({
            where: { procedureId },
            take: size,
            skip: (page - 1) * size,
         });
         return res.status(200).send({ procedures })
      }

      const procedures = await prisma.procedure.findMany({
         where: { areaId },
         take: size,
         skip: (page - 1) * size,
      });

      return res.status(200).send({ procedures })

   } catch (error) {
      console.log(error);
      throw new ListError()
   }


}