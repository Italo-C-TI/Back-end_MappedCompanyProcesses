import 'dotenv/config';
import { z } from  'zod'

const envSchema = z.object({
    NODE_ENV: z.enum(['dev', 'test', 'production']).default('dev'),
    PORT: z.coerce.number().default(3000)
})

const _env = envSchema.safeParse(process.env);

const texts = {
    environmentVariablesError: 'Invalid environment variables!'
}

if(!_env.success) {
    console.error(`❌ ${texts.environmentVariablesError}`, _env.error.format());
    throw new Error(texts.environmentVariablesError);
}

export const env = _env.data;