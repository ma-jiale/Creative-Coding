void setup() {
size(800, 600);
println(factorial(4));
}
void draw() {
background(175);

}
int factorial(int n) {
if (n == 1) {
return 1;
} else {
return n * factorial(n-1);
}
}
