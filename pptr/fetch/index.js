const puppeteer = require("puppeteer");

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  // let's navigate to the dev.to homepage
  await page.goto("https://dev.to");

  // evaluate will run the function in the page context
  // const output = await page.evaluate(() => {
  //   window
  //     .fetch("https://jsonplaceholder.typicode.com/comments/1")
  //     .then((r) => r.json())
  //     .then((j) => {
  //       console.log("j:");
  //       console.log(j);
  //       return Promise.resolve(j.email);
  //     });
  // });
  const output = await page.evaluate(async () => {
    const response = await fetch(
      "https://jsonplaceholder.typicode.com/comments/1"
    );
    const text = await response.text();
    return text;
  });

  console.log("output:");
  console.log(output);

  // we're done; close the browser
  await browser.close();
})();
