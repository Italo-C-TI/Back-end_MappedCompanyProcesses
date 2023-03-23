import { z } from "zod";
import { app } from "./app";
import { prisma } from "./lib/prisma";

app.post('/area', async(req, res)=>{
    const bodySchema = z.object({
        name:z.string(),
    });

    const {name} = bodySchema.parse(req.body);

    await prisma.area.create({
        data: {
            name
        },
    })
    return res.status(201).send();
})