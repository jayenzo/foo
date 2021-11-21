import express from 'express';
import axios from 'axios';

require('dotenv').config();

const PORT = 3000;
const app = express();

app.get('/foo-hello', async (_, res) => {
  const barData = await makeCall(process.env.BAR_URI);
  const bazData = await makeCall(process.env.BAZ_URI);
  res.send(`Hello from Foo!  ${barData} ${bazData}`);
});

app.listen(PORT, () => {
  console.log('Foo listening');
});

async function makeCall(URI: string): Promise<string> {
  try {
    const res = await axios.get(URI);
    return res.data as string;
  } catch (err) {
    console.log(err);
  }
}
