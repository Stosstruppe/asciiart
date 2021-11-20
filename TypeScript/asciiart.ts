// asciiart TypeScript
for (let y: number = -12; y <= 12; y++) {
	let line: string[] = [];
	for (let x: number = -39; x <= 39; x++) {
        let ca: number = x * 0.0458;
        let cb: number = y * 0.08333;
        let a: number = ca;
        let b: number = cb;
        let s: string = " ";
        for (let i: number = 0; i <= 15; i++) {
            let t: number = a * a - b * b + ca;
            b = 2 * a * b + cb;
            a = t;
            if ((a * a + b * b) > 4) {
                s = i.toString(16).toUpperCase();
                break;
            }
        }
		line.push(s);
	}
	console.log(line.join(""));
}
