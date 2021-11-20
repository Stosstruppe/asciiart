fn main() {
    for y in -12..13 {
        for x in -39..40 {
            let ca = (x as f32) * 0.0458;
            let cb = (y as f32) * 0.08333;
            let mut a = ca;
            let mut b = cb;
            let mut s = " ".to_string();
            for i in 0..16 {
                let t = a * a - b * b + ca;
                b = 2. * a * b + cb;
                a = t;
                if a * a + b * b > 4. {
                    s = format!("{:X}", i);
                    break;
                }
            }
            print!("{}", s);
        }
        println!();
    }
}
