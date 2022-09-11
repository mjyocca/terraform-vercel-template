import { VercelRequest, VercelResponse } from '@vercel/node';

export default async function handler(req: VercelRequest, res: VercelResponse) {
  return res.json({
    name: 'Hello World',
    code: 200,
    timestamp: new Date(),
  });
}