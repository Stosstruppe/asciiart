// asciiart Node.js
"use strict";

process.on("exit", function () {
    let log = "";
    for (let y = -12; y <= 12; y++) {
        for (let x = -39; x <= 39; x++) {
            const ca = x * 0.0458;
            const cb = y * 0.08333;
            let a = ca;
            let b = cb;
            let s = " ";
            for (let i = 0; i <= 15; i++) {
                const t = a * a - b * b + ca;
                b = 2 * a * b + cb;
                a = t;
                if ((a * a + b * b) > 4) {
                    s = i.toString(16).toUpperCase();
                    break;
                }
            }
            log += s;
        }
        log += "\n";
    }
    process.stdout.write(log);
});
