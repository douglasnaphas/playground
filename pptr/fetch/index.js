const puppeteer = require("puppeteer");

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  await page.goto("https://dev.to");

  const output = await page.evaluate(async () => {
    const email = await fetch("https://jsonplaceholder.typicode.com/comments/1")
      .then((r) => r.json())
      .then((j) => j.email);
    return email;
  });

  await page.evaluate((suffix) => {
    localStorage.setItem(`a${suffix}`, "bey");
  }, "y");
  const ay = await page.evaluate(() => {
    return localStorage.getItem("ay");
  });

  console.log("output:");
  console.log(output);

  console.log("ay:");
  console.log(ay);

  await browser.close();
})();
