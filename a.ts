function useBool(b: boolean) {
  if (b) {
    console.log("truthy");
    return;
  }
  console.log("falsy");
}

const ob = {
  a: "ay",
  b: "bee",
  c: false,
  d: true
}

useBool("c" in ob && ob.c);
useBool("d" in ob && ob.d);
useBool("e" in ob && ob.e);


export {};
