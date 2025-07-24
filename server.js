import express from "express";

const app = express();

app.get("/", (req, res) => {
  res.send("👋 VPS is alive with tmate!");
});

const port = 4000;
app.listen(port, () => {
  console.log(`🌍 Server running at http://localhost:${port}`);
});
